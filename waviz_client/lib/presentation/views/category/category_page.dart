import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/category/category_notifier.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final String categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseController.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(categoryNotifierProvider.notifier)
          .fetchProjects(widget.categoryId);
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoryNotifierProvider);
    final isLoading = categoryState.isLoading &&
        categoryState.projects.isEmpty &&
        categoryState.projectTypes.isEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "카테고리",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          const SimpleSearchIcon(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/home_outlined.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.wavizGray[600]!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? _buildLoadingView()
          : RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                await ref
                    .read(categoryNotifierProvider.notifier)
                    .refresh(widget.categoryId);
              },
              child: CustomScrollView(
                slivers: [
                  _buildHeroSection(),
                  _buildStickyTabSection(),
                  _buildContentSection(),
                  const SliverToBoxAdapter(child: Gap(24)),
                ],
              ),
            ),
    );
  }

  Widget _buildLoadingView() {
    return Column(
      children: [
        // Hero Section
        SizedBox(
          height: 204,
          child: PulseAnimationWidget(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.wavizGray[200]!,
                    AppColors.wavizGray[300]!,
                  ],
                ),
              ),
            ),
          ),
        ),

        // Tab Section
        const CategoryTabSkeleton(),
        const Divider(height: 0),

        // Content Section
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const FilterSection(),
                const Gap(16),
                Expanded(
                  child: ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (context, index) => const Gap(16),
                    itemBuilder: (context, index) => const ProjectCardSkeleton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return SliverToBoxAdapter(
      child: Container(
        height: 204,
        color: Colors.white,
        child: Consumer(
          builder: (context, ref, child) {
            final categoryState = ref.watch(categoryNotifierProvider);
            final projects = categoryState.projectState;

            return projects.when(
              data: (data) {
                if (data.isEmpty) {
                  return _buildEmptyHero();
                }
                return _buildFeaturedProject(data);
              },
              error: (error, trace) => SimpleErrorWidget(
                message: error.toString(),
              ),
              loading: () => PulseAnimationWidget(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.wavizGray[200]!,
                        AppColors.wavizGray[300]!,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.wavizGray[800]!,
            AppColors.wavizGray[600]!,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: Colors.white.withValues(alpha: 0.8),
          ),
          const Gap(12),
          const Text(
            "등록된 프로젝트가 없습니다",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const Gap(8),
          Text(
            "새로운 프로젝트가 곧 추가될 예정입니다",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProject(List projects) {
    final titleProject = projects[Random().nextInt(projects.length)];
    
    return HeroBackgroundImage(
      imageUrl: titleProject.thumbnail,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "FEATURED",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const Gap(8),
            Text(
              titleProject.title ?? "프로젝트",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Text(
              titleProject.description ?? "",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 14,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const Gap(8),
                Text(
                  DataUtils.getParticipantCountText(titleProject),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyTabSection() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabDelegate(
        child: Container(
          height: 100,
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
          child: Consumer(
            builder: (context, ref, child) {
              final categoryState = ref.watch(categoryNotifierProvider);
              final projectTypes = categoryState.projectTypes;

              if (projectTypes.isEmpty) {
                return const LoadingWidget();
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: projectTypes.length,
                itemBuilder: (context, index) {
                  final tab = projectTypes[index];
                  final isSelected =
                      categoryState.selectedType?.type == tab.type;

                  return Container(
                    margin: EdgeInsets.only(
                      right: index == projectTypes.length - 1 ? 0 : 16,
                    ),
                    child: IconTab(
                      icon: IconUtils.buildTabIcon(tab, isSelected),
                      text: tab.type ?? "",
                      isSelected: isSelected,
                      onTap: () {
                        ref
                            .read(categoryNotifierProvider.notifier)
                            .updateType(tab);
                        ref
                            .read(categoryNotifierProvider.notifier)
                            .fetchProjects(widget.categoryId);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer(
            builder: (context, ref, child) {
              final projects = ref.watch(categoryNotifierProvider).projectState;

              return projects.when(
                data: (data) {
                  if (data.isEmpty) {
                    return const EmptyStateWidget(
                      icon: Icons.inbox_outlined,
                      title: "등록된 프로젝트가 없습니다",
                      subtitle: "새로운 프로젝트가 곧 추가될 예정입니다",
                    );
                  }
                  return Column(
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          final categoryState = ref.watch(categoryNotifierProvider);
                          final currentFilter = categoryState.projectFilter?.value ?? "추천순";
                          
                          return FilterSection(
                            secondFilterText: currentFilter,
                            onSecondFilterPressed: () => _showFilterBottomSheet(),
                          );
                        },
                      ),
                      const Gap(16),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const Gap(16),
                        itemBuilder: (context, index) {
                          final project = data[index];
                          return ProjectCard(project: project);
                        },
                      ),
                    ],
                  );
                },
                error: (error, trace) => SimpleErrorWidget(
                  message: error.toString(),
                  onRetry: () {
                    ref
                        .read(categoryNotifierProvider.notifier)
                        .refresh(widget.categoryId);
                  },
                ),
                loading: () => Column(
                  children: [
                    const FilterSection(),
                    const Gap(12),
                    ...List.generate(
                      3,
                      (index) => const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: ProjectCardSkeleton(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return FilterBottomSheet(
          title: "정렬 방식",
          options: const [
            FilterOption(value: "추천순", label: "추천순"),
            FilterOption(value: "낮은 펀딩금액순", label: "낮은 펀딩금액순"),
            FilterOption(value: "높은 펀딩금액순", label: "높은 펀딩금액순"),
          ],
          selectedValue: ref.watch(categoryNotifierProvider).projectFilter?.value,
          onOptionSelected: (value) {
            // 선택된 값에 따라 필터 적용
            final filter = EnumCategoryProjectType.values.firstWhere(
              (e) => e.value == value,
              orElse: () => EnumCategoryProjectType.recommend,
            );
            ref
                .read(categoryNotifierProvider.notifier)
                .updateProjectFilter(filter);
          },
        );
      },
    );
  }
}
