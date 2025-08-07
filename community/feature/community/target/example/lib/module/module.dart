import 'package:core_util/util.dart';
import 'package:feature_community/community.dart';
import 'package:feature_community_example/route/route.dart';
import 'package:feature_search/community.dart';
import 'package:tool_community_network/network.dart';

class AppModule extends Module {
  AppModule({required this.baseUrl});

  final String baseUrl;

  @override
  List<Module> get imports => [
    CommunityMainModule(),
    CommunityDetailModule(),
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
  void routes(RouteManager r) {
    for (final ModularRoute route in ICommunityMainRoutes.routes) {
      r.add(route);
    }
  }
}
