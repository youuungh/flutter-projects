import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:feature_search/community.dart';
import 'package:flutter/material.dart';
// import 'package:search_di/di.dart';
import 'package:search_domain/domain.dart';
import 'package:search_presentation/presentation.dart';

enum SearchRoute {
  search,
  unknown;

  static String encode(SearchRoute value) => value.path;

  static SearchRoute decode(String value) => SearchRoute.values.firstWhere(
    (e) => e.path == value,
    orElse: () => SearchRoute.unknown,
  );
}

extension SearchRouteExtension on SearchRoute {
  String get path {
    if (this == SearchRoute.search) return '/$name';
    return '${SearchRoute.search.path}/$name';
  }
}

abstract class ISearchRoutes {
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

  static List<ModularRoute> routes = SearchRoute.values.map(_find).toList();

  static ModularRoute _find(SearchRoute route) {
    return ChildRoute(
      route.path,
      // child: (context) => findScreen(Uri.parse(route.path)),
      child: (context) => find(Uri.parse(route.path)),
      transition: _findTransitionType(route),
    );
  }

  static TransitionType? _findTransitionType(SearchRoute route) {
    switch (route) {
      default:
        return null;
    }
  }

  static Widget find(Uri uri) {
    return findProvider(uri, child: findScreen(uri));
  }

  static Widget findScreen(Uri uri) {
    final SearchRoute route = SearchRoute.decode(uri.path);

    switch (route) {
      case SearchRoute.search:
        // return const SearchBlocProvider(child: SearchScreen());
        return const SearchScreen();
      case SearchRoute.unknown:
        return const SizedBox();
    }
  }

  static Widget findProvider(Uri uri, {required Widget child}) {
    final SearchRoute route = SearchRoute.decode(uri.path);
    switch (route) {
      case SearchRoute.search:
        return FlowMultiBlocProvider(
          providers: [
            FlowBlocProvider<SearchQueryCubit>(
              create: (context) => SearchQueryCubit(),
            ),
            FlowBlocProvider<SearchRecentChannelListCubit>(
              create: (context) => SearchRecentChannelListCubit(
                Modular.get<SetRecentSearchChannelsUseCase>(
                  key: '$SearchModule$SetRecentSearchChannelsUseCase',
                ),
                Modular.get<GetRecentSearchChannelsUseCase>(
                  key: '$SearchModule$GetRecentSearchChannelsUseCase',
                ),
              ),
            ),
            FlowBlocProvider<SearchPopularChannelListCubit>(
              create: (context) => SearchPopularChannelListCubit(
                Modular.get<GetPopularChannelsForSearchUseCase>(
                  key: '$SearchModule$GetPopularChannelsForSearchUseCase',
                ),
              ),
            ),
            FlowBlocProvider<SearchPostListCubit>(
              create: (context) => SearchPostListCubit(
                Modular.get<GetSearchPostsUseCase>(
                  key: '$SearchModule$GetSearchPostsUseCase',
                ),
              ),
            ),
          ],
          child: child,
        );
      case SearchRoute.unknown:
        return child;
    }
  }
}

abstract class ISearchRouteTo {
  static Future<T?> push<T extends Object?>({
    required SearchRoute route,
    Map<String, String>? queryParameters,
  }) {
    return Modular.to.pushNamed<T>(route.path, arguments: queryParameters);
  }

  static Future<void> search() {
    return push<void>(route: SearchRoute.search);
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
  //   required SearchRoute route,
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
  // static Future<void> search(BuildContext context) {
  //   return push<void>(
  //     context,
  //     route: SearchRoute.search,
  //   );
  // }
}
