import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';

/// 커스텀 텍스트 폼 필드
class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool showPasswordToggle;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.enabled = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText && !_isPasswordVisible,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onTap: widget.onTap,
      enabled: widget.enabled,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null 
            ? Icon(widget.prefixIcon) 
            : null,
        suffixIcon: widget.showPasswordToggle
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.wavizGray[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.wavizGray[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

/// 이메일 입력 필드
class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const EmailFormField({
    super.key,
    required this.controller,
    this.hintText = "이메일 입력",
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText!,
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "이메일을 입력해주세요.";
        }
        if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return "올바른 이메일 형식이 아닙니다.";
        }
        return null;
      },
    );
  }
}

/// 비밀번호 입력 필드
class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;

  const PasswordFormField({
    super.key,
    required this.controller,
    this.hintText = "비밀번호 입력",
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText!,
      prefixIcon: Icons.lock_outline,
      obscureText: true,
      showPasswordToggle: true,
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return "비밀번호를 입력해주세요.";
        }
        return null;
      },
    );
  }
}

/// 비밀번호 확인 입력 필드
class PasswordConfirmFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final String? hintText;

  const PasswordConfirmFormField({
    super.key,
    required this.controller,
    required this.passwordController,
    this.hintText = "비밀번호 확인",
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText!,
      prefixIcon: Icons.lock_outline,
      obscureText: true,
      showPasswordToggle: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "비밀번호 확인을 입력해주세요.";
        }
        if (value != passwordController.text) {
          return "비밀번호가 일치하지 않습니다.";
        }
        return null;
      },
    );
  }
}

/// 로그인/회원가입 버튼
class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
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
              : backgroundColor ?? AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}

/// 폼 에러 메시지
class FormErrorMessage extends StatelessWidget {
  final String message;

  const FormErrorMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const Gap(8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

/// 로그인/회원가입 페이지 헤더
class AuthPageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const AuthPageHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.wavizGray[900],
          ),
        ),
        if (subtitle != null) ...[
          const Gap(8),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.wavizGray[600],
            ),
          ),
        ],
      ],
    );
  }
}

/// 회원가입/로그인 전환 링크
class AuthSwitchLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onPressed;

  const AuthSwitchLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.wavizGray[900],
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: onPressed,
          child: Text(linkText),
        ),
      ],
    );
  }
}

/// 로그인 정보 찾기 링크
class ForgotPasswordLink extends StatelessWidget {
  final VoidCallback? onPressed;

  const ForgotPasswordLink({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            "로그인 정보를 잊으셨나요?",
            style: TextStyle(color: AppColors.wavizGray[600]),
          ),
        ),
      ],
    );
  }
}
