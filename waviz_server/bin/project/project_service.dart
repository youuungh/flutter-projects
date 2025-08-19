import 'dart:typed_data';

import 'package:sqlite3/sqlite3.dart';

import '../common/model/project_type.dart';
import 'model/project_model.dart';
import 'model/reward_model.dart';

class ProjectService {
  final Database db;

  ProjectService(this.db);

  /// 프로젝트 타입 가져오기
  Future<List<ProjectType>> getProjectType() async {
    final ResultSet resultSet = db.select("""
          SELECT
            *
          FROM project_type
          """);

    List<ProjectType> result = [];
    for (final Row row in resultSet) {
      print(row.toString());
      result.add(ProjectType.fromJson(row));
    }
    return result;
  }

  /// 최적화된 프로젝트 ID 기반 조회
  Future<List<ProjectItemModel>> getProjectByProjectId(
    String? projectId,
  ) async {
    // 1. 기본 프로젝트 정보 조회
    final projectResult = db.select("""
      SELECT 
        p.*, 
        c.category, 
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
      WHERE p.id = $projectId
    """);

    if (projectResult.isEmpty) return [];

    // 2. 프로젝트 이미지 별도 조회
    final imageResult = db.select("""
      SELECT image
      FROM project_image
      WHERE project_id = $projectId
      LIMIT 1
    """);

    // 3. 통계 정보 별도 조회
    final waitlistResult = db.select("""
      SELECT COUNT(*) as count
      FROM waitlist
      WHERE project_id = $projectId
    """);

    final fundResult = db.select("""
      SELECT 
        COUNT(*) as count,
        COALESCE(SUM(price), 0) as total
      FROM fund
      WHERE project_id = $projectId
    """);

    // 4. 결과 조합
    final projectRow = Map<String, dynamic>.from(projectResult.first);
    projectRow['waitlist_count'] = waitlistResult.isNotEmpty ? waitlistResult.first['count'] : 0;
    projectRow['total_funded_count'] = fundResult.isNotEmpty ? fundResult.first['count'] : 0;
    projectRow['total_funded'] = fundResult.isNotEmpty ? fundResult.first['total'] : 0;
    projectRow['image'] = imageResult.isNotEmpty ? imageResult.first['image'] : null;

    return [ProjectItemModel.fromJson(projectRow)];
  }

  /// 최적화된 사용자 ID 기반 프로젝트 조회
  Future<List<ProjectItemModel>> getProjectByUserId(String? userId) async {
    final ResultSet resultSet = db.select("""
      SELECT   
        p.*,
        c.category,
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
      WHERE p.user_id = '$userId'
      ORDER BY p.created DESC
    """);

    List<ProjectItemModel> result = [];
    for (final Row row in resultSet) {
      print(row.toString());
      result.add(ProjectItemModel.fromJson(row));
    }
    return result;
  }

  Future<int> createProject(ProjectItemModel body) async {
    db.execute("""
    INSERT INTO project (
        category_id,
        project_type_id,
        project_class,
        user_id,
        title,
        owner,
        price,
        thumbnail,
        deadline,
        description,
        is_open,
        created
    ) VALUES (
        ${body.categoryId},
        ${body.projectTypeId},
        '${body.projectClass}',
        '${body.userId}',
        '${body.title}',
        '${body.owner}',
         ${body.price},
        '${body.thumbnail}',
        '${body.deadline}',
        '${body.description}',
        'close',
        DATETIME('now')
    ); 
    """);

    final lastPrjId = db.select("""
     SELECT * from project
    ORDER BY
    id DESC
    limit 1
    """);

    int projectId = 0;
    if (lastPrjId.isNotEmpty) {
      projectId = lastPrjId.first["id"] as int;
    }
    print(projectId);
    db.execute("""
    INSERT INTO project_image (
        project_id,
        image,
        created
    ) VALUES (
        $projectId,
        '${Uint8List.fromList(body.projectImage ?? [])}',
        DATETIME('now')
    );
    """);

    return projectId;
  }

  Future<bool> updateProjectOpenState(ProjectItemModel body, String id) async {
    db.execute("""
    UPDATE project
    SET is_open = '${body.isOpen}'
    WHERE id = $id;
    """);

    return true;
  }

  Future<bool> deleteProject(String id) async {
    db.execute("""DELETE FROM project WHERE id = $id; """);

    return true;
  }

  Future<int> createProjectReward(RewardItemModel body, String id) async {
    db.execute("""
    INSERT INTO reward (
        project_id,
        price,
        title,
        description,
        image_url,
        image_raw,
        created
    ) VALUES (
        $id,
        ${body.price},
        '${body.title}',
        '${body.description}',
        '${body.imageUrl}',
        '${Uint8List.fromList(body.imageRaw)}',
        DATETIME('now')
    ); 
    """);

    final lastPrjId = db.select("""
     SELECT * from project
    ORDER BY
    id DESC
    limit 1
    """);

    int projectId = 0;
    if (lastPrjId.isNotEmpty) {
      projectId = lastPrjId.first["id"] as int;
    }

    return projectId;
  }
}
