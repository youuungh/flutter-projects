import 'package:community/module/module.dart';
import 'package:community/screen/screen.dart';
import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';

// import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

enum CommunityMainRoute {
  root,
  splash,
  unknown;

  static String encode(CommunityMainRoute value) => value.path;

  static CommunityMainRoute decode(String value) =>
      CommunityMainRoute.values.firstWhere(
        (e) => e.path == value,
        orElse: () => CommunityMainRoute.unknown,
      );
}

extension CommunityRouteExtension on CommunityMainRoute {
  String get path {
    const String root = '/';
    if (this == CommunityMainRoute.root) return root;
    return '$root$name';
  }
}

abstract class ICommunityMainRoutes {
  // static Route<dynamic> find(RouteSettings settings) {
  //   final Uri uri = Uri.tryParse(settings.name ?? '') ?? Uri();
  //   final Map<String, String> queryParameters = <String, String>{
  //     ...uri.queryParameters,
  //   };
  //   final bool fullscreenDialog =
  //       bool.tryParse(queryParameters['fullscreenDialog'] ?? '') ?? false;
  //   return MaterialPageRoute(
  //     builder: (context) => findScreen(uri),
  //     settings: settings,
  //     fullscreenDialog: fullscreenDialog,
  //   );
  // }

  static List<ModularRoute> routes = CommunityMainRoute.values
      .map(_find)
      .toList();

  static ModularRoute _find(CommunityMainRoute route) {
    return ChildRoute(
      route.path,
      //child: (context) => findScreen(Uri.parse(route.path)),
      child: (context) => find(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(CommunityMainRoute route) {
    switch (route) {
      default:
        return null;
    }
  }

  static Widget find(Uri uri) {
    return findProvider(
      uri,
      child: findScreen(uri),
    );
  }

  static Widget findScreen(Uri uri) {
    final CommunityMainRoute route = CommunityMainRoute.decode(uri.path);

    switch (route) {
      case CommunityMainRoute.root:
        //return const HomeBlocProvider(child: HomeScreen());
        return const HomeScreen();
      case CommunityMainRoute.splash:
        return const SplashScreen();
      case CommunityMainRoute.unknown:
        return const SizedBox();
    }
  }

  static Widget findProvider(
    Uri uri, {
    required Widget child,
  }) {
    final CommunityMainRoute route = CommunityMainRoute.decode(uri.path);
    switch (route) {
      case CommunityMainRoute.root:
        return FlowBlocProvider<HomeTabCubit>(
          create: (context) => HomeTabCubit(),
          child: child,
        );
      case CommunityMainRoute.splash:
        return FlowBlocProvider<AdCubit>(
          create: (context) => AdCubit(
            Modular.get<GetAdImageUseCase>(
              key: '$CommunityMainModule$GetAdImageUseCase',
            ),
          ),
          child: child,
        );
      case CommunityMainRoute.unknown:
        return child;
    }
  }
}

abstract class ICommunityMainRouteTo {
  static Future<T?> push<T extends Object?>({
    required CommunityMainRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(
      route.path,
      arguments: queryParameters,
    );
  }

  static Future<void> root() {
    return push<void>(
      route: CommunityMainRoute.root,
    );
  }

  // static Future<T?> pushNamed<T extends Object?>(
  //   BuildContext context, {
  //   required String path,
  //   Map<String, String>? queryParameters,
  //   bool fullscreenDialog = false,
  // }) async {
  //   final Map<String, String> params = {
  //     if (queryParameters != null) ...queryParameters,
  //     'fullscreenDialog': fullscreenDialog.toString(),
  //   };
  //
  //   final Uri uri = Uri(
  //     path: path,
  //     queryParameters: params,
  //   );
  //
  //   final Object? result = await Navigator.of(
  //     context,
  //   ).pushNamed<Object?>(uri.toString());
  //   return result as T?;
  // }
  //
  // static Future<T?> push<T extends Object?>(
  //   BuildContext context, {
  //   required CommunityMainRoute route,
  //   Map<String, String>? queryParameters,
  //   bool fullscreenDialog = false,
  // }) {
  //   return pushNamed<T>(
  //     context,
  //     path: route.path,
  //     queryParameters: queryParameters,
  //     fullscreenDialog: fullscreenDialog,
  //   );
  // }
  //
  // static Future<void> root(BuildContext context) {
  //   return push<void>(
  //     context,
  //     route: CommunityMainRoute.root,
  //   );
  // }
}
