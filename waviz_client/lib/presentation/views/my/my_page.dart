import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/theme.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';
import 'package:waviz_client/presentation/notifiers/my/my_notifier.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: AppColors.wavizGray[900],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final loginState = ref.watch(loginNotifierProvider);
              if (loginState.isLogin) {
                return IconButton(
                  onPressed: () => _showLogoutDialog(),
                  icon: const Icon(Icons.logout),
                  color: AppColors.wavizGray[600],
                  tooltip: "로그아웃",
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          final loginState = ref.read(loginNotifierProvider);
          if (loginState.isLogin) {
            await ref.read(myPageNotifierProvider.notifier).refresh();
          }
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Consumer(
            builder: (context, ref, child) {
              final myPageState = ref.watch(myPageNotifierProvider);
              final loginState = ref.watch(loginNotifierProvider);

              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // 사용자 정보 섹션
                          _UserSection(
                            loginState: loginState,
                            myPageState: myPageState,
                          ),
                          const Gap(24),

                          // 프로젝트 섹션
                          if (loginState.isLogin) ...[
                            _ProjectSection(
                              myPageState: myPageState,
                              onProjectOptionsPressed: _showProjectOptionsBottomSheet,
                            ),
                            const Gap(24),
                          ],

                          // 프로젝트 만들기 버튼
                          LoginRequiredButton(
                            isLoggedIn: loginState.isLogin,
                            loggedInText: '새 프로젝트 만들기',
                            loggedOutText: '로그인 후 프로젝트 만들기',
                            onPressed: () {
                              if (!loginState.isLogin) {
                                _showLoginRequiredDialog();
                                return;
                              }
                              context.push("/add");
                            },
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),

                    // 메뉴 섹션
                    const _MenuSection(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() async {
    final confirmed = await WavizDialog.confirm(
      context: context,
      title: "로그아웃",
      message: "정말 로그아웃하시겠습니까?",
      confirmText: "로그아웃",
      cancelText: "취소",
      isDestructive: false,
    );

    if (confirmed == true) {
      await ref.read(loginNotifierProvider.notifier).signOut();
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('로그아웃되었습니다')));
      }
    }
  }

  void _showLoginRequiredDialog() async {
    final goToLogin = await WavizDialog.loginRequired(context: context);

    if (goToLogin == true && context.mounted) {
      context.push("/login");
    }
  }

  void _showProjectOptionsBottomSheet(ProjectEntity project) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (modalContext) => Consumer(
        builder: (context, ref, child) {
          return _ProjectOptionsBottomSheet(
            project: project,
            onRewardAdd: () {
              Navigator.pop(modalContext);
              context.push("/add/reward/${project.id}");
            },
            onStatusEdit: () {
              Navigator.pop(modalContext);
              _showEditStatusDialog(project);
            },
            onDelete: () {
              Navigator.pop(modalContext);
              _showDeleteDialog(project);
            },
          );
        },
      ),
    );
  }

  void _showEditStatusDialog(ProjectEntity project) async {
    final newStatus = await WavizDialog.switchInput(
      context: context,
      title: "프로젝트 상태 수정",
      message: "프로젝트의 공개 상태를 변경할 수 있습니다.",
      switchLabel: "프로젝트 오픈",
      switchSubtitle: DataUtils.isProjectOpen(project.isOpen) ? "현재 진행중" : "현재 준비중",
      initialValue: DataUtils.isProjectOpen(project.isOpen),
      confirmText: "저장",
      cancelText: "취소",
    );

    if (newStatus != null) {
      final updatedProject = ProjectEntity(
        id: project.id,
        isOpen: newStatus ? "open" : "close",
      );

      final result = await ref
          .read(myPageNotifierProvider.notifier)
          .updateProject(project.id.toString(), updatedProject);

      if (context.mounted) {
        if (result) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('프로젝트가 수정되었습니다')));
        } else {
          WavizDialog.error(
            context: context,
            title: "수정 실패",
            message: "프로젝트 수정에 실패했습니다.\n다시 시도해주세요.",
          );
        }
      }
    }
  }

  void _showDeleteDialog(ProjectEntity project) async {
    final confirmed = await WavizDialog.confirm(
      context: context,
      title: "프로젝트 삭제",
      message: "'${project.title}' 프로젝트를 삭제하시겠습니까?\n\n삭제된 프로젝트는 복구할 수 없습니다.",
      confirmText: "삭제",
      cancelText: "취소",
      isDestructive: true,
    );

    if (confirmed == true) {
      final result = await ref
          .read(myPageNotifierProvider.notifier)
          .deleteProject(project.id.toString());

      if (context.mounted) {
        if (result) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('프로젝트가 삭제되었습니다')));
        } else {
          WavizDialog.error(
            context: context,
            title: "삭제 실패",
            message: "프로젝트 삭제에 실패했습니다.\n다시 시도해주세요.",
          );
        }
      }
    }
  }
}

/// 사용자 정보 섹션
class _UserSection extends StatelessWidget {
  final LoginState loginState;
  final MyPageState myPageState;

  const _UserSection({
    required this.loginState,
    required this.myPageState,
  });

  @override
  Widget build(BuildContext context) {
    if (loginState.isLogin) {
      return Row(
        children: [
          UserAvatar(
            fallbackText: myPageState.loginEntity?.username,
            radius: 24,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myPageState.loginEntity?.username ?? "사용자",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  myPageState.loginEntity?.email ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.wavizGray[600],
                  ),
                ),
                const Gap(4),
                Text(
                  "환영합니다! 함께 새로운 프로젝트를 만들어보세요.",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.wavizGray[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          const UserAvatar(radius: 24),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.push("/login"),
                  child: const Row(
                    children: [
                      Text(
                        "로그인하기",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      Gap(4),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                const Gap(4),
                Text(
                  "로그인 후 다양한 프로젝트에 참여해보세요.",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.wavizGray[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}

/// 프로젝트 섹션
class _ProjectSection extends ConsumerWidget {
  final MyPageState myPageState;
  final Function(ProjectEntity) onProjectOptionsPressed;

  const _ProjectSection({
    required this.myPageState,
    required this.onProjectOptionsPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (myPageState.isLoading && myPageState.userProjects.isEmpty) {
      return const SizedBox(
        height: 200,
        child: LoadingWidget(),
      );
    }

    if (myPageState.errorMessage != null && myPageState.userProjects.isEmpty) {
      return SizedBox(
        height: 200,
        child: CommonErrorWidget(
          message: myPageState.errorMessage!,
          onRetry: () {
            ref.read(myPageNotifierProvider.notifier).refresh();
          },
        ),
      );
    }

    if (myPageState.userProjects.isEmpty) {
      return const SizedBox(
        height: 200,
        child: _EmptyProjectWidget(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "나의 프로젝트 (${myPageState.userProjects.length}개)",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            if (myPageState.isLoading) const InlineLoadingWidget(),
          ],
        ),
        const Gap(12),
        Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: myPageState.userProjects.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final project = myPageState.userProjects[index];
              return _ProjectItem(
                project: project,
                onOptionsPressed: () => onProjectOptionsPressed(project),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// 프로젝트 아이템
class _ProjectItem extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback onOptionsPressed;

  const _ProjectItem({
    required this.project,
    required this.onOptionsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            project.type ?? "?",
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: Text(
        project.title ?? "제목 없음",
        style: const TextStyle(fontWeight: FontWeight.w600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (project.description != null)
            Text(
              project.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: AppColors.wavizGray[600]),
            ),
          const Gap(4),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: DataUtils.isProjectOpen(project.isOpen)
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.wavizGray[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  DataUtils.getProjectStatusText(project.isOpen),
                  style: TextStyle(
                    fontSize: 10,
                    color: DataUtils.isProjectOpen(project.isOpen)
                        ? AppColors.primary
                        : AppColors.wavizGray[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(8),
              Text(
                "참여자 ${DataUtils.formatNumber(project.totalFundedCount)}명",
                style: TextStyle(fontSize: 10, color: AppColors.wavizGray[500]),
              ),
            ],
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onOptionsPressed,
        icon: CommonIcons.more(),
      ),
    );
  }
}

/// 프로젝트 옵션 바텀시트
class _ProjectOptionsBottomSheet extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback onRewardAdd;
  final VoidCallback onStatusEdit;
  final VoidCallback onDelete;

  const _ProjectOptionsBottomSheet({
    required this.project,
    required this.onRewardAdd,
    required this.onStatusEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.wavizGray[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(16),

          // 프로젝트 제목
          Text(
            project.title ?? "프로젝트",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(20),

          // 리워드 추가
          _BottomSheetOption(
            icon: Icons.add_circle_outline,
            text: '리워드 추가',
            iconColor: AppColors.primary,
            onTap: onRewardAdd,
          ),

          // 상태 수정
          _BottomSheetOption(
            icon: Icons.edit_outlined,
            text: '상태 수정',
            iconColor: AppColors.wavizGray[600],
            onTap: onStatusEdit,
          ),

          // 삭제
          _BottomSheetOption(
            icon: Icons.delete_outline,
            text: '삭제',
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: onDelete,
          ),

          const Gap(8),
        ],
      ),
    );
  }
}

/// 바텀시트 옵션 아이템
class _BottomSheetOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback onTap;

  const _BottomSheetOption({
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.wavizGray[600],
              size: 24,
            ),
            const Gap(12),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 빈 프로젝트 위젯
class _EmptyProjectWidget extends StatelessWidget {
  const _EmptyProjectWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.wavizGray[200],
          child: SvgPicture.asset(
            "assets/icons/featured_seasonal_and_gifts.svg",
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        const Gap(16),
        const Text(
          "새로운 도전을\n시작해보세요",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const Gap(8),
        Text(
          "개인 후원부터 제품, 콘텐츠, 서비스 출시까지\n함께 성장해나가요.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: AppColors.wavizGray[600]),
        ),
      ],
    );
  }
}

/// 메뉴 섹션
class _MenuSection extends StatelessWidget {
  const _MenuSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        children: [
          _MenuItem(
            icon: Icons.help_outline,
            title: "도움말",
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.info_outline,
            title: "앱 정보",
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.privacy_tip_outlined,
            title: "개인정보 처리방침",
            onTap: () {},
          ),
          _MenuItem(
            icon: Icons.description_outlined,
            title: "이용약관",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

/// 메뉴 아이템
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.wavizGray[600]),
      title: Text(title),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: AppColors.wavizGray[400],
      ),
      onTap: onTap,
    );
  }
}
