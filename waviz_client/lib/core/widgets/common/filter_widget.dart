import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';

/// 필터 섹션 위젯
class FilterSection extends StatelessWidget {
  final String firstFilterText;
  final String secondFilterText;
  final VoidCallback? onFirstFilterPressed;
  final VoidCallback? onSecondFilterPressed;

  const FilterSection({
    super.key,
    this.firstFilterText = "전체",
    this.secondFilterText = "추천순",
    this.onFirstFilterPressed,
    this.onSecondFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          _FilterChip(
            text: firstFilterText,
            onPressed: onFirstFilterPressed,
            backgroundColor: AppColors.wavizGray[50],
            textColor: AppColors.wavizGray[600],
          ),
          const Gap(12),
          _FilterChip(
            text: secondFilterText,
            onPressed: onSecondFilterPressed,
            backgroundColor: Colors.white,
            textColor: AppColors.wavizGray[700],
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const _FilterChip({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.wavizGray[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor ?? AppColors.wavizGray[600],
              ),
            ),
            const Gap(4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: AppColors.wavizGray[500],
            ),
          ],
        ),
      ),
    );
  }
}

/// 필터 바텀시트 위젯
class FilterBottomSheet extends StatelessWidget {
  final List<FilterOption> options;
  final String? selectedValue;
  final ValueChanged<String> onOptionSelected;
  final String title;

  const FilterBottomSheet({
    super.key,
    required this.options,
    this.selectedValue,
    required this.onOptionSelected,
    this.title = "필터 선택",
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(16),
          ...options.map((option) {
            final isSelected = selectedValue == option.value;
            return InkWell(
              onTap: () {
                onOptionSelected(option.value);
                Navigator.pop(context);
              },
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
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.wavizGray[400],
                    ),
                    const Gap(12),
                    Text(
                      option.label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.wavizGray[700],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const Gap(8),
        ],
      ),
    );
  }
}

class FilterOption {
  final String value;
  final String label;

  const FilterOption({
    required this.value,
    required this.label,
  });
}
