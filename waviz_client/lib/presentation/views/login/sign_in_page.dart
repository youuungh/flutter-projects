import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더
              const AuthPageHeader(title: "로그인"),
              const Gap(32),
              
              // 입력 필드
              Column(
                children: [
                  EmailFormField(controller: emailTextController),
                  const Gap(20),
                  PasswordFormField(controller: passwordTextController),
                ],
              ),
              const Gap(8),
              
              // 비밀번호 찾기 링크
              ForgotPasswordLink(
                onPressed: () {
                  // TODO: 비밀번호 찾기 기능 구현
                },
              ),
              const Gap(24),
              
              // 로그인 버튼
              AuthButton(
                text: "이메일로 로그인하기",
                isLoading: loginState.isLoading,
                onPressed: () => _handleSignIn(),
              ),
              const Gap(24),
              
              // 회원가입 링크
              AuthSwitchLink(
                text: "아직 계정이 없나요?",
                linkText: "회원가입",
                onPressed: () {
                  context.push("/sign-up");
                },
              ),
              const Gap(16),
              
              // 에러 메시지
              if (loginState.errorMessage != null)
                FormErrorMessage(message: loginState.errorMessage!),
              
              // 추가 여백 (키보드 공간 확보)
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      final result = await ref
          .read(loginNotifierProvider.notifier)
          .signIn(
            emailTextController.text.trim(),
            passwordTextController.text.trim(),
          );

      if (context.mounted) {
        if (result != null) {
          Navigator.of(context).pop();
        } else {
          final loginState = ref.read(loginNotifierProvider);
          WavizDialog.error(
            context: context,
            title: "로그인 실패",
            message: loginState.errorMessage ?? 
                "로그인에 실패했습니다.\n이메일과 비밀번호를 확인해주세요.",
          );
        }
      }
    }
  }
}
