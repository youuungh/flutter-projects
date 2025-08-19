import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';

/// 공통 searchbar 위젯
class CommonSearchBar extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  final VoidCallback? onNotificationPressed;
  final bool showNotification;
  final bool enabled;

  const CommonSearchBar({
    super.key,
    this.hintText = "새로운 일상이 필요하신가요?",
    this.onTap,
    this.onNotificationPressed,
    this.showNotification = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.wavizGray[200]!,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    enabled: enabled,
                    onTap: onTap,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.wavizGray[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.wavizGray[400],
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              if (showNotification) ...[
                const Gap(12),
                IconButton(
                  onPressed: onNotificationPressed,
                  icon: Icon(
                    Icons.notifications_none,
                    color: AppColors.wavizGray[600],
                    size: 28,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// 앱바에 들어가는 간단한 검색 아이콘
class SimpleSearchIcon extends StatelessWidget {
  final VoidCallback? onPressed;

  const SimpleSearchIcon({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.search, color: AppColors.wavizGray[600]),
    );
  }
}
