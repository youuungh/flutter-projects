import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/presentation/views/project/detail/project_detail_widget.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/favorite/favorite_notifier.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';
import 'package:waviz_client/presentation/notifiers/project/project_notifier.dart';

class ProjectDetailPage extends ConsumerStatefulWidget {
  final String project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  ConsumerState<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends ConsumerState<ProjectDetailPage> {
  late ProjectEntity projectEntity;
  late ScrollController scrollController;
  ValueNotifier<bool> isScrolled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);

    try {
      final Map<String, dynamic> projectData = json.decode(widget.project);
      projectEntity = ProjectEntity.fromJson(projectData);
    } catch (e) {
      projectEntity = ProjectEntity(id: 0, title: "프로젝트 정보를 불러올 수 없습니다");
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    isScrolled.dispose();
    super.dispose();
  }

  void _onScroll() {
    final bool shouldChangeStyle =
        scrollController.hasClients && scrollController.offset > 200;

    if (isScrolled.value != shouldChangeStyle) {
      isScrolled.value = shouldChangeStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, ref, child) {
          if (projectEntity.id == 0) {
            return const Center(
              child: CommonErrorWidget(
                title: "프로젝트 정보를 불러올 수 없습니다",
                message: "잘못된 프로젝트 정보입니다.",
              ),
            );
          }

          final project = ref.watch(
            projectDetailNotifierProvider(projectEntity.id.toString()),
          );

          return project.when(
            data: (data) {
              final displayProject = data ?? projectEntity;

              return CustomScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  // 상단 이미지와 AppBar
                  SliverAppBar(
                    expandedHeight: 280,
                    floating: false,
                    pinned: true,
                    stretch: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: ValueListenableBuilder<bool>(
                      valueListenable: isScrolled,
                      builder: (context, scrolled, child) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: scrolled
                                ? Colors.transparent
                                : Colors.black.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: scrolled ? Colors.black : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [],
                      background: HeroBackgroundImage(
                        imageUrl: displayProject.thumbnail,
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ),

                  // 프로젝트 상세 내용
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 120),
                      child: ProjectDetailWidget(data: displayProject),
                    ),
                  ),
                ],
              );
            },
            error: (error, trace) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Container(
                      margin: const EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    child: CommonErrorWidget(
                      message: error.toString(),
                      onRetry: () {
                        // 새로고침 트리거
                        setState(() {});
                      },
                    ),
                  ),
                ],
              );
            },
            loading: () {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Container(
                      margin: const EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                  const SliverFillRemaining(
                    child: LoadingWidget(),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: _BottomAppBar(projectEntity: projectEntity),
    );
  }
}

/// 하단 앱바
class _BottomAppBar extends ConsumerWidget {
  final ProjectEntity projectEntity;

  const _BottomAppBar({required this.projectEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favoriteNotifierProvider);

    final isFavorite = favoriteState.favoriteProjects.any(
      (project) => project.id == projectEntity.id,
    );

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.wavizGray[200]!)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          // 좋아요 버튼
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _toggleFavorite(context, ref, isFavorite),
                icon: CommonIcons.favorite(
                  isFilled: isFavorite,
                  color: isFavorite ? Colors.red : AppColors.wavizGray[600],
                ),
                style: IconButton.styleFrom(padding: const EdgeInsets.all(8)),
              ),
              Text(
                "${favoriteState.favoriteProjects.length}",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.wavizGray[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Gap(16),

          // 펀딩하기 버튼
          Expanded(
            child: PrimaryButton(
              text: DataUtils.isProjectOpen(projectEntity.isOpen) 
                  ? "펀딩하기" 
                  : "출시 알림받기",
              onPressed: () => _showFundingDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFavorite(
    BuildContext context,
    WidgetRef ref,
    bool isFavorite,
  ) async {
    final loginState = ref.read(loginNotifierProvider);
    if (!loginState.isLogin) {
      final goToLogin = await WavizDialog.loginRequired(
        context: context,
        title: "로그인 필요",
        message: "관심 프로젝트 기능을 사용하려면\n로그인이 필요합니다.",
      );

      if (goToLogin == true && context.mounted) {
        context.push("/login");
      }
      return;
    }

    if (isFavorite) {
      final confirmed = await WavizDialog.confirm(
        context: context,
        title: "관심 프로젝트 해제",
        message: "이 프로젝트를 관심 목록에서 제거하시겠습니까?",
        confirmText: "제거",
        cancelText: "취소",
        isDestructive: false,
      );

      if (confirmed == true) {
        final categoryEntity = CategoryEntity(
          id: projectEntity.id,
          thumbnail: projectEntity.thumbnail,
          description: projectEntity.description,
          title: projectEntity.title,
          owner: projectEntity.owner,
          totalFunded: projectEntity.totalFunded,
          totalFundedCount: projectEntity.totalFundedCount,
        );

        ref.read(favoriteNotifierProvider.notifier).removeItem(categoryEntity);

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('관심 프로젝트에서 제거되었습니다')));
        }
      }
    } else {
      final categoryEntity = CategoryEntity(
        id: projectEntity.id,
        thumbnail: projectEntity.thumbnail,
        description: projectEntity.description,
        title: projectEntity.title,
        owner: projectEntity.owner,
        totalFunded: projectEntity.totalFunded,
        totalFundedCount: projectEntity.totalFundedCount,
      );

      ref.read(favoriteNotifierProvider.notifier).addItem(categoryEntity);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('관심 프로젝트에 추가되었습니다')));
    }
  }

  void _showFundingDialog(BuildContext context) async {
    final isOpen = DataUtils.isProjectOpen(projectEntity.isOpen);

    final confirmed = await WavizDialog.confirm(
      context: context,
      title: isOpen ? "펀딩하기" : "출시 알림받기",
      message: isOpen 
          ? "펀딩 페이지로 이동하시겠습니까?" 
          : "프로젝트가 오픈되면 알림을 보내드릴게요.",
      confirmText: "확인",
      cancelText: "취소",
      isDestructive: false,
    );

    if (confirmed == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isOpen ? "펀딩 기능은 준비 중입니다" : "알림이 설정되었습니다"
          )
        ),
      );
    }
  }
}
