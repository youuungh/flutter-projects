import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';
import 'package:sqlite3/sqlite3.dart';

import 'auth/auth_router.dart';
import 'auth/auth_service.dart';
import 'category/category_router.dart';
import 'category/category_service.dart';
import 'common/db/db_service.dart';
import 'home/home_router.dart';
import 'home/home_service.dart';
import 'project/project_router.dart';
import 'project/project_service.dart';
import 'router/api_router.dart';

final log = Logger('Waviz-Server');

void main(List<String> args) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  /// 파일 존재 여부 확인
  Directory current = Directory.current;
  print(current.path);
  final file = File(join(current.path, "waviz.db"));
  bool needsInit = !(await file.exists());

  /// 데이터베이스 연결
  Database db = sqlite3.open("waviz.db");
  
  /// SQLite 성능 최적화 설정
  db.execute("PRAGMA journal_mode = WAL;");      // 동시성 향상
  db.execute("PRAGMA synchronous = NORMAL;");    // 안전성과 성능 균형
  db.execute("PRAGMA cache_size = 10000;");      // 캐시 크기 증가 (40MB)
  db.execute("PRAGMA temp_store = MEMORY;");     // 임시 데이터를 메모리에
  db.execute("PRAGMA mmap_size = 268435456;");   // 메모리 맵 크기 256MB
  
  DbService dbService = DbService(db);

  /// 초기화가 필요하면 테이블 생성
  if (needsInit) {
    log.info("새 데이터베이스 초기화 중...");
    dbService.dropTables();
    dbService.initTables();
    dbService.insertDummyDatas();
  }

  final ip = InternetAddress.anyIPv4;
  AuthService authService = AuthService(db);
  HomeService homeService = HomeService(db);
  CategoryService categoryService = CategoryService(db);
  ProjectService projectService = ProjectService(db);

  final apiRouter = ApiRouter(
    authRouter: AuthRouter(authService),
    homeRouter: HomeRouter(homeService),
    categoryRouter: CategoryRouter(categoryService),
    projectRouter: ProjectRouter(projectService),
  ).router;

  /// Swagger UI 생성
  final SwaggerUI swaggerUI = SwaggerUI(
    'swagger.yaml',
    title: 'Waviz API Documentation',
  );

  /// 루트 경로 처리
  final rootRouter = Router();
  rootRouter.get('/', (Request request) {
    return Response.movedPermanently('/');
  });

  final Handler handler = Cascade()
      .add(rootRouter.call)
      .add(apiRouter.call)
      .add(swaggerUI.call)
      .handler;

  final finalHandler = Pipeline()
      .addMiddleware(corsHeaders())
      .addMiddleware(logRequests())
      .addHandler(handler);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(finalHandler, ip, port);
  log.info('Server listening on port ${server.port}');
  log.info('API Documentation available at: http://localhost:${server.port}/docs');
  log.info('API Base URL: http://localhost:${server.port}/api/v1');
}
