import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/home/home_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            // 상단 검색바와 알림 영역
            CommonSearchBar(
              onTap: () {},
              onNotificationPressed: () {},
            ),

            // 메인 컨텐츠
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () async {
                  ref.read(homeNotifierProvider.notifier).refresh();
                },
                child: CustomScrollView(
                  slivers: [
                    // 카테고리 섹션
                    _buildCategorySection(),

                    // 추천 프로젝트 섹션 헤더
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: SectionHeader(
                          title: "지금 인기있는 프로젝트",
                          actionText: "더보기",
                          onActionPressed: () {},
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                        ),
                      ),
                    ),

                    const SliverToBoxAdapter(child: Gap(12)),

                    // 프로젝트 리스트
                    _buildProjectList(),

                    // 하단 여백
                    const SliverToBoxAdapter(child: Gap(24)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: "관심사 찾기",
              badge: const NewBadge(),
            ),
            SizedBox(
              height: 200,
              child: Consumer(
                builder: (context, ref, child) {
                  final homeState = ref.watch(homeNotifierProvider);
                  final categories = homeState.categories;

                  if (homeState.isLoading && categories.isEmpty) {
                    return const LoadingWidget();
                  }

                  if (homeState.errorMessage != null && categories.isEmpty) {
                    return SimpleErrorWidget(
                      message: homeState.errorMessage!,
                      onRetry: () {
                        ref.read(homeNotifierProvider.notifier).refresh();
                      },
                    );
                  }

                  if (categories.isEmpty) {
                    return const EmptyStateWidget(
                      icon: Icons.category,
                      title: "카테고리가 없습니다",
                    );
                  }

                  return _buildCategoryGrid(categories);
                },
              ),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(List categories) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final data = categories[index];
        return InkWell(
          onTap: () {
            context.push("/home/category/${data.id}");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.bg,
                child: Image.asset(
                  data.iconPath ?? "",
                  height: 32,
                  width: 32,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.category,
                      size: 32,
                      color: AppColors.primary,
                    );
                  },
                ),
              ),
              const Gap(8),
              Text(
                data.title ?? "??",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.wavizGray[700],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectList() {
    return Consumer(
      builder: (context, ref, child) {
        final homeState = ref.watch(homeNotifierProvider);
        final projects = homeState.projects;

        if (homeState.isLoading && projects.isEmpty) {
          return const SliverFillRemaining(
            child: LoadingWidget(),
          );
        }

        if (homeState.errorMessage != null && projects.isEmpty) {
          return SliverFillRemaining(
            child: CommonErrorWidget(
              message: homeState.errorMessage!,
              onRetry: () => ref.read(homeNotifierProvider.notifier).refresh(),
              showCopyButton: true,
            ),
          );
        }

        if (projects.isEmpty) {
          return SliverFillRemaining(
            child: EmptyStateWidget(
              icon: Icons.inbox_outlined,
              title: "아직 프로젝트가 없습니다",
              buttonText: "새로고침",
              onPressed: () {
                ref.read(homeNotifierProvider.notifier).refresh();
              },
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final project = projects[index];
              return ProjectLargeCard(
                projectDataString: jsonEncode(project.toJson()),
              );
            },
            childCount: projects.length,
          ),
        );
      },
    );
  }
}
