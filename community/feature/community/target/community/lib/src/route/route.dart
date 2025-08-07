// import 'package:community_di/di.dart';
import 'package:community_domain/domain.dart';
import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:feature_community/community.dart';
import 'package:flutter/material.dart';

enum CommunityDetailRoute {
  community,
  post,
  write,
  unknown;

  static String encode(CommunityDetailRoute value) => value.path;

  static CommunityDetailRoute decode(String value) =>
      CommunityDetailRoute.values.firstWhere(
        (e) => e.path == value,
        orElse: () => CommunityDetailRoute.unknown,
      );
}

extension CommunityDetailRouteExtension on CommunityDetailRoute {
  String get path {
    if (this == CommunityDetailRoute.community) return '/$name';
    return '${CommunityDetailRoute.community.path}/$name';
  }
}

abstract class ICommunityDetailRoutes {
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

  static List<ModularRoute> routes = CommunityDetailRoute.values
      .map(_find)
      .toList();

  static ModularRoute _find(CommunityDetailRoute route) {
    return ChildRoute(
      route.path,
      child: (context) => find(Uri.parse(route.path)),
      // findScreen(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(CommunityDetailRoute route) {
    switch (route) {
      case CommunityDetailRoute.write:
        return TransitionType.downToUp;
      default:
        return null;
    }
  }

  static Widget find(Uri uri) {
    return findProvider(uri, child: findScreen(uri));
  }

  static Widget findScreen(Uri uri) {
    final CommunityDetailRoute route = CommunityDetailRoute.decode(uri.path);
    // final Map<String, String> queryParameters = {...uri.queryParameters};

    switch (route) {
      case CommunityDetailRoute.community:
        //return const CommunityBlocProvider(child: CommunityScreen());
        return const CommunityScreen();
      case CommunityDetailRoute.post:
        // final String id = queryParameters['id'] ?? '';
        final String id = Modular.args.data?['id'] as String? ?? '';
        //return PostBlocProvider(child: PostScreen(id: id));
        return PostScreen(id: id);
      case CommunityDetailRoute.write:
        //return const WriteBlocProvider(child: WriteScreen());
        //return const WriteProvider(child: WriteScreen());
        return const WriteScreen();
      case CommunityDetailRoute.unknown:
        return const SizedBox();
    }
  }

  static Widget findProvider(Uri uri, {required Widget child}) {
    final CommunityDetailRoute route = CommunityDetailRoute.decode(uri.path);
    switch (route) {
      case CommunityDetailRoute.community:
        return FlowMultiBlocProvider(
          providers: [
            FlowBlocProvider<CommunityChannelListCubit>(
              create: (context) => CommunityChannelListCubit(
                Modular.get<GetChannelsUseCase>(
                  key: '$CommunityDetailModule$GetChannelsUseCase',
                ),
              ),
            ),
            FlowBlocProvider<CommunityPopularChannelListCubit>(
              create: (context) => CommunityPopularChannelListCubit(
                Modular.get<GetPopularChannelsUseCase>(
                  key: '$CommunityDetailModule$GetPopularChannelsUseCase',
                ),
              ),
            ),
            FlowBlocProvider<CommunityPostListCubit>(
              create: (context) => CommunityPostListCubit(
                Modular.get<GetPostsUseCase>(
                  key: '$CommunityDetailModule$GetPostsUseCase',
                ),
              ),
            ),
            FlowBlocProvider<CommunityPopularPostListCubit>(
              create: (context) => CommunityPopularPostListCubit(
                Modular.get<GetPostsUseCase>(
                  key: '$CommunityDetailModule$GetPostsUseCase',
                ),
              ),
            ),
          ],
          child: child,
        );
      case CommunityDetailRoute.post:
        return FlowMultiBlocProvider(
          providers: [
            FlowBlocProvider<PostCubit>(
              create: (context) => PostCubit(
                Modular.get<GetPostUseCase>(
                  key: '$CommunityDetailModule$GetPostUseCase',
                ),
              ),
            ),
            FlowBlocProvider<PostCommentListCubit>(
              create: (context) => PostCommentListCubit(
                Modular.get<GetCommentsUseCase>(
                  key: '$CommunityDetailModule$GetCommentsUseCase',
                ),
              ),
            ),
          ],
          child: child,
        );
      case CommunityDetailRoute.write:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<WritePostViewModel>(
              create: (context) => WritePostViewModel(
                Modular.get<CreatePostUseCase>(
                  key: '$CommunityDetailModule$CreatePostUseCase',
                ),
              ),
            ),
            ChangeNotifierProvider<WriteMyViewModel>(
              create: (context) => WriteMyViewModel(
                Modular.get<GetMyUseCase>(
                  key: '$CommunityDetailModule$GetMyUseCase',
                ),
              ),
            ),
          ],
          child: child,
        );
      case CommunityDetailRoute.unknown:
        return child;
    }
  }
}

abstract class ICommunityDetailRouteTo {
  static Future<T?> push<T extends Object?>({
    required CommunityDetailRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(route.path, arguments: queryParameters);
  }

  static Future<void> community() {
    return push<void>(route: CommunityDetailRoute.community);
  }

  static Future<void> post({required String id}) {
    return push<void>(
      route: CommunityDetailRoute.post,
      queryParameters: {'id': id},
    );
  }

  static Future<void> write() {
    return push<void>(route: CommunityDetailRoute.write);
  }

  // static Future<T?> pushNamed<T extends Object?>(
  //     BuildContext context, {
  //       required String path,
  //       Map<String, String>? queryParameters,
  //       bool fullscreenDialog = false,
  //     }) async {
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
  //     BuildContext context, {
  //       required CommunityDetailRoute route,
  //       Map<String, String>? queryParameters,
  //       bool fullscreenDialog = false,
  //     }) {
  //   return pushNamed<T>(
  //     context,
  //     path: route.path,
  //     queryParameters: queryParameters,
  //     fullscreenDialog: fullscreenDialog,
  //   );
  // }
  //
  // static Future<void> community(BuildContext context) {
  //   return push<void>(
  //     context,
  //     route: CommunityDetailRoute.community,
  //   );
  // }
  //
  // static Future<void> post(
  //     BuildContext context, {
  //       required String id,
  //     }) {
  //   return push<void>(
  //     context,
  //     route: CommunityDetailRoute.post,
  //     queryParameters: {
  //       'id': id,
  //     },
  //   );
  // }
  //
  // static Future<void> write(BuildContext context) {
  //   return push<void>(
  //     context,
  //     route: CommunityDetailRoute.write,
  //     fullscreenDialog: true,
  //   );
  // }
}
