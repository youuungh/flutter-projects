import 'package:sqlite3/sqlite3.dart';

import '../server.dart';
import 'model/category_model.dart';

class CategoryService {
  final Database db;

  CategoryService(this.db);

  /// 최적화된 전체 프로젝트 조회
  Future<List<CategoryItemModel>?> getAllProjects() async {
    // 1. 기본 프로젝트 정보만 먼저 조회
    final projectsResult = db.select("""
      SELECT 
        p.*, 
        c.category, 
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
      ORDER BY p.created DESC
      LIMIT 15
    """);

    if (projectsResult.isEmpty) return [];

    return await _enrichWithStats(projectsResult);
  }

  /// 카테고리별 프로젝트 조회
  Future<List<CategoryItemModel>?> getProjectsByCategoryId(
    String categoryId,
  ) async {
    final projectsResult = db.select("""
      SELECT 
        p.*, 
        c.category, 
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
      WHERE p.category_id = $categoryId
      ORDER BY p.created DESC
      LIMIT 25
    """);

    if (projectsResult.isEmpty) return [];

    final enrichedProjects = await _enrichWithStats(projectsResult);
    
    // 베스트 프로젝트 필터링
    return enrichedProjects?.where((project) {
      final totalBackers = project.totalFundedCount ?? 0;
      final totalFunded = project.totalFunded ?? 0;
      final targetPrice = project.price ?? 0;
      
      return totalBackers >= 1000 && totalFunded >= (targetPrice * 1000);
    }).take(5).toList();
  }

  /// 프로젝트 타입별 조회
  Future<List<CategoryItemModel>?> getProjectsByProjectTypeId(
    String categoryId,
    String projectTypeId,
  ) async {
    String sql = """
      SELECT 
        p.*, 
        c.category, 
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
    """;

    String whereClause = "";
    
    if (projectTypeId == "best" || projectTypeId == "all") {
      whereClause = "WHERE p.category_id = $categoryId";
    } else {
      whereClause = "WHERE p.category_id = $categoryId AND p.project_type_id = $projectTypeId";
    }

    sql += "$whereClause ORDER BY p.created DESC LIMIT 25";

    final projectsResult = db.select(sql);

    if (projectsResult.isEmpty) return [];

    final enrichedProjects = await _enrichWithStats(projectsResult);
    
    // "best" 타입인 경우 추가 필터링
    if (projectTypeId == "best") {
      return enrichedProjects?.where((project) {
        final totalBackers = project.totalFundedCount ?? 0;
        final totalFunded = project.totalFunded ?? 0;
        final targetPrice = project.price ?? 0;
        
        return totalBackers >= 500 && totalFunded >= (targetPrice * 500);
      }).toList();
    }
    
    return enrichedProjects;
  }

  /// 베스트 프로젝트 조회
  Future<List<CategoryItemModel>?> getBestProjects(
    String categoryId,
    String projectTypeId,
  ) async {
    final projectsResult = db.select("""
      SELECT 
        p.*, 
        c.category, 
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
      WHERE p.category_id = $categoryId
      ORDER BY p.created DESC
      LIMIT 50
    """);

    if (projectsResult.isEmpty) return [];

    final enrichedProjects = await _enrichWithStats(projectsResult);
    
    // 베스트 조건 필터링
    final bestProjects = enrichedProjects?.where((project) {
      final totalBackers = project.totalFundedCount ?? 0;
      final totalFunded = project.totalFunded ?? 0;
      final targetPrice = project.price ?? 0;
      
      return totalBackers >= 1000 && totalFunded >= (targetPrice * 1000);
    }).take(15).toList();
    
    return bestProjects;
  }

  /// 공통 메서드: 프로젝트에 통계 정보 추가
  Future<List<CategoryItemModel>?> _enrichWithStats(
    List<Row> projectsResult
  ) async {
    if (projectsResult.isEmpty) return [];

    // 프로젝트 ID 목록 추출
    final projectIds = projectsResult.map((row) => row['id'] as int).toList();
    final idList = projectIds.join(',');

    // 대기자 수 집계
    final waitlistStats = <int, int>{};
    if (projectIds.isNotEmpty) {
      final waitlistResult = db.select("""
        SELECT project_id, COUNT(*) as count
        FROM waitlist 
        WHERE project_id IN ($idList)
        GROUP BY project_id
      """);
      for (final row in waitlistResult) {
        waitlistStats[row['project_id'] as int] = row['count'] as int;
      }
    }

    // 펀딩 통계 집계
    final fundStats = <int, Map<String, dynamic>>{};
    if (projectIds.isNotEmpty) {
      final fundResult = db.select("""
        SELECT 
          project_id, 
          COUNT(*) as backers,
          COALESCE(SUM(price), 0) as total
        FROM fund 
        WHERE project_id IN ($idList)
        GROUP BY project_id
      """);
      for (final row in fundResult) {
        fundStats[row['project_id'] as int] = {
          'backers': row['backers'] as int,
          'total': row['total'] as int,
        };
      }
    }

    // 결과 조합
    List<CategoryItemModel> result = [];
    for (final row in projectsResult) {
      final projectId = row['id'] as int;
      final waitlistCount = waitlistStats[projectId] ?? 0;
      final fundData = fundStats[projectId] ?? {'backers': 0, 'total': 0};
      
      // 기존 fromJson 메서드 활용을 위해 row에 집계 데이터 추가
      final enrichedRow = Map<String, dynamic>.from(row);
      enrichedRow['waitlist_count'] = waitlistCount;
      enrichedRow['total_funded_count'] = fundData['backers'];
      enrichedRow['total_funded'] = fundData['total'];
      
      result.add(CategoryItemModel.fromJson(enrichedRow));
    }
    
    return result;
  }
}
