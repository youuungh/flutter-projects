import 'package:sqlite3/sqlite3.dart';

import 'model/home_model.dart';

class HomeService {
  final Database db;

  HomeService(this.db);

  Future<List<HomeItemModel>?> getProjects() async {
    final stopwatch = Stopwatch()..start();
    
    // 1. 기본 프로젝트 정보만 빠르게 조회
    final projectsResult = db.select("""
      SELECT 
        p.*, 
        c.category, 
        pt.type
      FROM project p
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN project_type pt ON p.project_type_id = pt.id
      WHERE p.is_open = 'open'
      ORDER BY p.created DESC
      LIMIT 10
    """);

    if (projectsResult.isEmpty) {
      stopwatch.stop();
      print('⚡ getProjects completed in ${stopwatch.elapsedMilliseconds}ms (empty result)');
      return [];
    }

    // 2. 프로젝트 ID 목록 추출
    final projectIds = projectsResult.map((row) => row['id'] as int).toList();
    final idList = projectIds.join(',');

    // 3. 대기자 수 집계
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

    // 4. 펀딩 통계 집계
    final fundStats = <int, Map<String, dynamic>>{};
    if (projectIds.isNotEmpty) {
      final fundResult = db.select("""
        SELECT 
          project_id, 
          COUNT(*) as count,
          COALESCE(SUM(price), 0) as total
        FROM fund 
        WHERE project_id IN ($idList)
        GROUP BY project_id
      """);
      for (final row in fundResult) {
        fundStats[row['project_id'] as int] = {
          'count': row['count'] as int,
          'total': row['total'] as int,
        };
      }
    }

    // 5. 결과 조합
    List<HomeItemModel> result = [];
    for (final row in projectsResult) {
      final projectId = row['id'] as int;
      final waitlistCount = waitlistStats[projectId] ?? 0;
      final fundData = fundStats[projectId] ?? {'count': 0, 'total': 0};
      
      // 기존 fromJson 메서드 활용을 위해 row에 집계 데이터 추가
      final enrichedRow = Map<String, dynamic>.from(row);
      enrichedRow['waitlist_count'] = waitlistCount;
      enrichedRow['total_funded_count'] = fundData['count'];
      enrichedRow['total_funded'] = fundData['total'];
      
      result.add(HomeItemModel.fromJson(enrichedRow));
    }
    
    stopwatch.stop();
    print('⚡ getProjects completed in ${stopwatch.elapsedMilliseconds}ms (${result.length} projects)');
    
    return result;
  }

  /// 캐싱을 활용한 프로젝트 조회
  Map<String, dynamic>? _cachedProjects;
  DateTime? _lastCacheTime;
  static const cacheDuration = Duration(minutes: 5);

  Future<List<HomeItemModel>?> getProjectsWithCache() async {
    // 캐시가 유효하면 캐시된 데이터 반환
    if (_cachedProjects != null && 
        _lastCacheTime != null && 
        DateTime.now().difference(_lastCacheTime!) < cacheDuration) {
      return _cachedProjects!['projects'] as List<HomeItemModel>;
    }

    // 캐시가 없거나 만료되면 새로 조회
    final projects = await getProjects();
    
    // 캐시 업데이트
    _cachedProjects = {'projects': projects};
    _lastCacheTime = DateTime.now();
    
    return projects;
  }
}
