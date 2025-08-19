import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';

/// 공통 빈 상태 위젯
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onPressed;
  final Color? iconColor;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.buttonText,
    this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: iconColor ?? AppColors.wavizGray[400],
          ),
          const Gap(16),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.wavizGray[600],
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            const Gap(8),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.wavizGray[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (buttonText != null && onPressed != null) ...[
            const Gap(24),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(buttonText!),
            ),
          ],
        ],
      ),
    );
  }
}

/// 로그인 필요 빈 상태 위젯
class LoginRequiredEmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onLoginPressed;
  final VoidCallback? onExplorePressed;

  const LoginRequiredEmptyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onLoginPressed,
    this.onExplorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: AppColors.wavizGray[400],
          ),
          const Gap(24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.wavizGray[700],
              height: 1.4,
            ),
          ),
          const Gap(12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.wavizGray[500],
              height: 1.4,
            ),
          ),
          const Gap(32),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '로그인하기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (onExplorePressed != null) ...[
            const Gap(16),
            TextButton(
              onPressed: onExplorePressed,
              child: Text(
                '프로젝트 둘러보기',
                style: TextStyle(
                  color: AppColors.wavizGray[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
