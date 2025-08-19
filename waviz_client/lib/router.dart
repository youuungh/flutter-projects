import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';
import 'package:waviz_client/presentation/views/home/home_page.dart';
import 'package:waviz_client/presentation/views/waviz_app_shell.dart';

import 'presentation/views/category/category_page.dart';
import 'presentation/views/favorite/favorite_page.dart';
import 'presentation/views/login/sign_in_page.dart';
import 'presentation/views/login/sign_up_page.dart';
import 'presentation/views/my/my_page.dart';
import 'presentation/views/project/add_project_page.dart';
import 'presentation/views/project/add_reward_page.dart';
import 'presentation/views/project/project_detail_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/home",
    redirect: (context, state) {
      final loginState = ref.read(loginNotifierProvider);
      final isLogin = loginState.isLogin;
      
      // 로그인이 필요한 페이지들 (프로젝트 추가 관련만)
      final protectedRoutes = ['/add'];
      final isProtectedRoute = protectedRoutes.any((route) => state.uri.path.startsWith(route));
      
      // 로그인 관련 페이지들
      final authRoutes = ['/login', '/sign-up'];
      final isAuthRoute = authRoutes.contains(state.uri.path);
      
      // 로그인되지 않았고 보호된 페이지에 접근하려고 하면 로그인 페이지로
      if (!isLogin && isProtectedRoute) {
        return '/login';
      }
      
      // 로그인되어 있고 로그인/회원가입 페이지에 있으면 홈으로
      if (isLogin && isAuthRoute) {
        return '/home';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: "/login",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: "/sign-up",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          return const SignUpPage();
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return WavizAppShell(
            currentIndex: switch (state.uri.path) {
              var p when p.startsWith("/favorite") => 2,
              var p when p.startsWith("/my") => 3,
              _ => 0,
            },
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "/home",
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: 'category/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return CategoryPage(categoryId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: "/favorite",
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const FavoritePage();
            },
          ),
          GoRoute(
            path: "/my",
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const MyPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: "/add",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AddProjectPage(),
        routes: [
          GoRoute(
            path: "reward/:id",
            builder: (context, state) {
              final projectId = state.pathParameters['id']!;
              return AddRewardPage(projectId: projectId);
            },
          ),
        ],
      ),
      GoRoute(
        path: "/detail",
        builder: (context, state) {
          final project = state.extra as String;
          return ProjectDetailPage(project: project);
        },
      ),
    ],
  );
});
