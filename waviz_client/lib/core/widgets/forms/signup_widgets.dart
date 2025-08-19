import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';

/// 이메일 인증 섹션
class EmailVerificationSection extends StatefulWidget {
  final TextEditingController emailController;
  final bool isValidated;
  final bool isLoading;
  final ValueChanged<bool> onValidationChanged;
  final Future<bool> Function(String) onVerifyEmail;

  const EmailVerificationSection({
    super.key,
    required this.emailController,
    required this.isValidated,
    required this.isLoading,
    required this.onValidationChanged,
    required this.onVerifyEmail,
  });

  @override
  State<EmailVerificationSection> createState() => _EmailVerificationSectionState();
}

class _EmailVerificationSectionState extends State<EmailVerificationSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormSectionLabel(text: "이메일 계정"),
        const Gap(12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.emailController,
                decoration: const InputDecoration(hintText: "이메일 입력"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "필수 입력 항목입니다.";
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "올바른 이메일 형식이 아닙니다.";
                  }
                  return null;
                },
                onChanged: (value) {
                  // 이메일이 변경되면 인증 상태 초기화
                  widget.onValidationChanged(false);
                },
              ),
            ),
            const Gap(12),
            EmailVerificationButton(
              isValidated: widget.isValidated,
              isLoading: widget.isLoading,
              onPressed: () => _handleEmailVerification(),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _handleEmailVerification() async {
    final email = widget.emailController.text.trim();
    
    if (email.isEmpty) {
      _showError("이메일을 입력해주세요.");
      return;
    }
    
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _showError("올바른 이메일 형식이 아닙니다.");
      return;
    }

    final result = await widget.onVerifyEmail(email);
    
    if (mounted) {
      widget.onValidationChanged(result);
      if (result) {
        _showSuccess("등록 가능한 이메일입니다.");
      } else {
        _showError("등록 불가능한 이메일입니다.\n이미 등록된 이메일입니다.");
      }
    }
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const Gap(8),
            Text(message),
          ],
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const Gap(8),
            Text(message),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}

/// 이메일 인증 버튼
class EmailVerificationButton extends StatelessWidget {
  final bool isValidated;
  final bool isLoading;
  final VoidCallback onPressed;

  const EmailVerificationButton({
    super.key,
    required this.isValidated,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 56,
        width: 90,
        decoration: BoxDecoration(
          color: isValidated 
              ? AppColors.primary 
              : (isLoading 
                  ? AppColors.wavizGray[300] 
                  : AppColors.primary.withValues(alpha: .55)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  isValidated ? "확인완료" : "인증하기",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

/// 비밀번호 섹션
class PasswordSection extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const PasswordSection({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<PasswordSection> createState() => _PasswordSectionState();
}

class _PasswordSectionState extends State<PasswordSection> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormSectionLabel(text: "비밀번호"),
        const Gap(12),
        TextFormField(
          controller: widget.passwordController,
          decoration: InputDecoration(
            hintText: "비밀번호 입력 (8자 이상)",
            filled: true,
            fillColor: AppColors.newBg,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          obscureText: !_isPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "필수 입력 항목입니다.";
            }
            if (value.length < 8) {
              return "비밀번호는 8자 이상 입력해주세요.";
            }
            return null;
          },
        ),
        const Gap(12),
        TextFormField(
          controller: widget.confirmPasswordController,
          decoration: InputDecoration(
            hintText: "비밀번호 확인",
            filled: true,
            fillColor: AppColors.newBg,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
          ),
          obscureText: !_isConfirmPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "필수 입력 항목입니다.";
            }
            if (value != widget.passwordController.text.trim()) {
              return "비밀번호가 일치하지 않습니다.";
            }
            return null;
          },
        ),
      ],
    );
  }
}

/// 이름 입력 섹션
class NameSection extends StatelessWidget {
  final TextEditingController controller;

  const NameSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormSectionLabel(text: "이름"),
        const Gap(12),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(hintText: "이름 입력"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "필수 입력 항목입니다.";
            }
            if (value.length < 2) {
              return "이름은 2글자 이상 입력해주세요.";
            }
            return null;
          },
        ),
      ],
    );
  }
}

/// 폼 섹션 라벨
class FormSectionLabel extends StatelessWidget {
  final String text;

  const FormSectionLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}

/// 회원가입 완료 버튼
class SignUpCompleteButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;

  const SignUpCompleteButton({
    super.key,
    required this.isLoading,
    this.onPressed,
    this.text = "약관 동의 후 가입 완료하기",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isLoading 
              ? AppColors.wavizGray[300]
              : AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
