import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:feature_my/community.dart';
import 'package:flutter/material.dart';

// import 'package:my_di/di.dart';
import 'package:my_domain/domain.dart';
import 'package:my_presentation/presentation.dart';

enum MyRoute {
  my,
  unknown;

  static String encode(MyRoute value) => value.path;

  static MyRoute decode(String value) => MyRoute.values.firstWhere(
    (e) => e.path == value,
    orElse: () => MyRoute.unknown,
  );
}

extension MyRouteExtension on MyRoute {
  String get path {
    if (this == MyRoute.my) return '/$name';
    return '${MyRoute.my.path}/$name';
  }
}

abstract class IMyRoutes {
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

  static List<ModularRoute> routes = MyRoute.values.map(_find).toList();

  static ModularRoute _find(MyRoute route) {
    return ChildRoute(
      route.path,
      // child: (context) => findScreen(Uri.parse(route.path)),
      child: (context) => find(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(MyRoute route) {
    switch (route) {
      default:
        return null;
    }
  }

  static Widget find(Uri uri) {
    return findProvider(uri, child: findScreen(uri));
  }

  static Widget findScreen(Uri uri) {
    final MyRoute route = MyRoute.decode(uri.path);

    switch (route) {
      case MyRoute.my:
        //return const MyBlocProvider(child: MyScreen());
        // return const MyProvider(child: MyScreen());
        return const MyScreen();
      case MyRoute.unknown:
        return const SizedBox();
    }
  }

  static Widget findProvider(Uri uri, {required Widget child}) {
    final MyRoute route = MyRoute.decode(uri.path);

    switch (route) {
      case MyRoute.my:
        return ChangeNotifierProvider<MyViewModel>(
          create: (context) => MyViewModel(
            Modular.get<GetMyPageUseCase>(key: '$MyModule$GetMyPageUseCase'),
          ),
          child: child,
        );
      case MyRoute.unknown:
        return child;
    }
  }
}

abstract class IMyRouteTo {
  static Future<T?> push<T extends Object?>({
    required MyRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(route.path, arguments: queryParameters);
  }

  static Future<void> my() {
    return push<void>(route: MyRoute.my);
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
  //   required MyRoute route,
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
  // static Future<void> my(BuildContext context) {
  //   return push<void>(
  //     context,
  //     route: MyRoute.my,
  //   );
  // }
}
