import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/presentation/notifiers/login/login_notifier.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController password2TextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  bool validated = false;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    password2TextController.dispose();
    usernameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 헤더
                const AuthPageHeader(title: "이메일 간편가입"),
                const Gap(20),
                
                // 이메일 인증 섹션
                EmailVerificationSection(
                  emailController: emailTextController,
                  isValidated: validated,
                  isLoading: loginState.isLoading,
                  onValidationChanged: (isValid) {
                    setState(() {
                      validated = isValid;
                    });
                  },
                  onVerifyEmail: (email) async {
                    return await ref
                        .read(loginNotifierProvider.notifier)
                        .checkEmail(email);
                  },
                ),
                const Gap(20),
                
                // 이름 섹션
                NameSection(controller: usernameTextController),
                const Gap(20),
                
                // 비밀번호 섹션
                PasswordSection(
                  passwordController: passwordTextController,
                  confirmPasswordController: password2TextController,
                ),
                const Gap(32),
                
                // 회원가입 완료 버튼
                SignUpCompleteButton(
                  isLoading: loginState.isLoading,
                  onPressed: () => _handleSignUp(),
                ),
                const Gap(16),
                
                // 에러 메시지
                if (loginState.errorMessage != null)
                  FormErrorMessage(message: loginState.errorMessage!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignUp() async {
    if (formKey.currentState!.validate()) {
      if (!validated) {
        WavizDialog.error(
          context: context,
          title: "이메일 인증 필요",
          message: "이메일 중복확인을 완료해주세요.",
        );
        return;
      }

      final result = await ref
          .read(loginNotifierProvider.notifier)
          .signUp(
            emailTextController.text.trim(),
            passwordTextController.text.trim(),
            usernameTextController.text.trim(),
          );

      if (context.mounted) {
        if (result) {
          WavizDialog.success(
            context: context,
            title: "회원가입 완료",
            message: "회원가입이 완료되었습니다.\n로그인을 진행해주세요.",
            onConfirm: () {
              context.pop(); // 회원가입 페이지 닫기
            },
          );
        } else {
          final loginState = ref.read(loginNotifierProvider);
          WavizDialog.error(
            context: context,
            title: "회원가입 실패",
            message: loginState.errorMessage ?? 
                "회원가입에 실패했습니다.\n다시 시도해주세요.",
          );
        }
      }
    }
  }
}
