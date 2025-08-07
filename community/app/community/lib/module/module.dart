import 'package:community/route/route.dart';
import 'package:core_util/util.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:feature_community/community.dart';
import 'package:feature_my/community.dart';
import 'package:feature_notification/community.dart';
import 'package:feature_search/community.dart';
import 'package:tool_community_network/network.dart';

class AppModule extends Module {
  AppModule({required this.baseUrl});

  final String baseUrl;

  @override
  List<Module> get imports => [
    CommunityMainModule(),
    CommunityDetailModule(),
    NotificationModule(),
    MyModule(),
    SearchModule(),
  ];

  @override
  void binds(Injector i) {
    i
      ..addSingleton(EventBus.new)
      ..addSingleton(() => CommunityRestClient()..update(baseUrl: baseUrl));

    imports.map((import) => import.binds(i)).toList();
  }

  @override
  void exportedBinds(Injector i) =>
      imports.map((import) => import.exportedBinds(i)).toList();

  @override
  void routes(RouteManager r) =>
      imports.map((import) => import.routes(r)).toList();
}

class CommunityMainModule extends Module {
  @override
  void binds(Injector i) {
    /// Remote Data Source
    i..addLazySingleton<IFirebaseRemoteDataSource>(
      FirebaseRemoteDataSource.new,
      key: '$CommunityMainModule$IFirebaseRemoteDataSource',
    )

    /// Data Source
    ..addLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSource(
        i.get<IFirebaseRemoteDataSource>(
          key: '$CommunityMainModule$IFirebaseRemoteDataSource',
        ),
      ),
      key: '$CommunityMainModule$FirebaseDataSource',
    )

    /// Repository
    ..addLazySingleton<IFirebaseRepository>(
      () => FirebaseRepository(
        i.get<FirebaseDataSource>(
          key: '$CommunityMainModule$FirebaseDataSource',
        ),
      ),
      key: '$CommunityMainModule$IFirebaseRepository',
    )

    /// Use Case
    ..addLazySingleton<GetAdImageUseCase>(
      () => GetAdImageUseCase(
        i.get<IFirebaseRepository>(
          key: '$CommunityMainModule$IFirebaseRepository',
        ),
      ),
      key: '$CommunityMainModule$GetAdImageUseCase',
    );
  }

  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in ICommunityMainRoutes.routes) {
      r.add(route);
    }
  }
}
