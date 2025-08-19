import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/favorite/favorite_notifier.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  final List<String> tabs = ["펀딩", "메이커", "알림신청", "펀딩/프리오더", "스토어"];
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            PageHeader(
              title: "관심 있는 소식만 모았어요",
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
            ),

            // Tab Section
            HorizontalTabWidget(
              tabs: tabs,
              selectedIndex: selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),
            const Gap(16),

            // Content Section
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final loginState = ref.watch(loginNotifierProvider);
                  final favoriteState = ref.watch(favoriteNotifierProvider);

                  // 로그인 상태 확인
                  if (!loginState.isLogin) {
                    return LoginRequiredEmptyWidget(
                      title: "관심 프로젝트를 확인하려면\n로그인이 필요해요",
                      subtitle: "로그인 후 마음에 드는 프로젝트에 ♥를 눌러\n관심 프로젝트로 저장해보세요",
                      onLoginPressed: () async {
                        final goToLogin = await WavizDialog.loginRequired(
                          context: context,
                          title: "로그인 필요",
                          message: "관심 프로젝트 기능을 사용하려면\n로그인이 필요합니다.",
                        );

                        if (goToLogin == true && context.mounted) {
                          context.push("/login");
                        }
                      },
                      onExplorePressed: () {
                        context.go("/home");
                      },
                    );
                  }

                  // 로딩 상태 처리
                  if (favoriteState.isLoading && favoriteState.favoriteProjects.isEmpty) {
                    return const LoadingWidget(
                      message: '관심 프로젝트를 불러오는 중...',
                    );
                  }

                  // 에러 상태 처리
                  if (favoriteState.errorMessage != null && favoriteState.favoriteProjects.isEmpty) {
                    return CommonErrorWidget(
                      message: favoriteState.errorMessage!,
                      onRetry: () {
                        ref.read(favoriteNotifierProvider.notifier).refresh();
                      },
                    );
                  }

                  // 빈 상태 처리
                  if (favoriteState.favoriteProjects.isEmpty) {
                    return EmptyStateWidget(
                      icon: Icons.favorite_border,
                      title: "아직 관심 프로젝트가 없어요",
                      subtitle: "마음에 드는 프로젝트에 ♥를 눌러보세요",
                      buttonText: "프로젝트 둘러보기",
                      onPressed: () {
                        context.go("/home");
                      },
                    );
                  }

                  // 데이터가 있는 경우 리스트 표시
                  return _buildFavoriteList(favoriteState);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteList(FavoriteState favoriteState) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // 프로젝트 개수 정보
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.wavizGray[100]!,
                  width: 1,
                ),
              ),
            ),
            child: Text(
              '총 ${favoriteState.favoriteProjects.length}개의 관심 프로젝트',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.wavizGray[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(favoriteNotifierProvider.notifier).refresh();
              },
              color: AppColors.primary,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: favoriteState.favoriteProjects.length,
                itemBuilder: (context, index) {
                  final project = favoriteState.favoriteProjects[index];
                  return ProjectLargeCard(
                    projectDataString: jsonEncode(project.toJson()),
                    showFavorite: true,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
