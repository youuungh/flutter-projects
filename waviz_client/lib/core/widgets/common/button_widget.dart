import 'package:flutter/material.dart';
import 'package:waviz_client/theme.dart';

/// 기본 primary 버튼
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 50,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null 
              ? AppColors.primary 
              : AppColors.wavizGray[300],
          foregroundColor: onPressed != null 
              ? Colors.white 
              : AppColors.wavizGray[600],
          padding: padding ?? const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}

/// outline 버튼
class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;

  const OutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: 1,
          ),
          foregroundColor: textColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

/// text 버튼
class SimpleTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final FontWeight? fontWeight;

  const SimpleTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? AppColors.primary,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}

/// 로그인이 필요한 버튼 (활성화/비활성화)
class LoginRequiredButton extends StatelessWidget {
  final bool isLoggedIn;
  final String loggedInText;
  final String loggedOutText;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const LoginRequiredButton({
    super.key,
    required this.isLoggedIn,
    required this.loggedInText,
    required this.loggedOutText,
    required this.onPressed,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isLoggedIn ? AppColors.primary : AppColors.wavizGray[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            isLoggedIn ? loggedInText : loggedOutText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: isLoggedIn ? Colors.white : AppColors.wavizGray[600],
            ),
          ),
        ),
      ),
    );
  }
}
