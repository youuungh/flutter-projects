import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/dialogs/dialogs.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

class WavizAppShell extends ConsumerStatefulWidget {
  const WavizAppShell({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

  @override
  ConsumerState<WavizAppShell> createState() => _WavizAppShellState();
}

class _WavizAppShellState extends ConsumerState<WavizAppShell> {
  void _onItemTapped(int index, BuildContext context) {
    if (index == 1) {
      if (ref.read(loginNotifierProvider).isLogin) {
        GoRouter.of(context).push("/add");
      } else {
        WavizDialog.info(
          context: context,
          title: "안내",
          message: "로그인이 필요한 서비스입니다.",
        );
        return;
      }
    } else if (index == 2) {
      GoRouter.of(context).go("/favorite");
    } else if (index == 3) {
      GoRouter.of(context).go("/my");
    } else {
      GoRouter.of(context).go("/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "홈",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.add), label: "프로젝트"),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 2 ? Icons.favorite : Icons.favorite_border,
            ),
            label: "구독",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 3 ? Icons.person : Icons.person_2_outlined,
            ),
            label: "마이페이지",
          ),
        ],
      ),
    );
  }
}
