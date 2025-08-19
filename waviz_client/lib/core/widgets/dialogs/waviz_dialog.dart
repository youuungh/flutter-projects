import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waviz_client/theme.dart';
class WavizDialog {
  WavizDialog._();

  /// 성공 알림 Dialog
  static Future<void> success({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "확인",
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _WavizDialogWidget<void>(
        title: title,
        message: message,
        actions: [
          _DialogAction(
            text: confirmText,
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm?.call();
            },
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  /// 오류 알림 Dialog
  static Future<void> error({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "확인",
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _WavizDialogWidget<void>(
        title: title,
        message: message,
        actions: [
          _DialogAction(
            text: confirmText,
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm?.call();
            },
            isPrimary: true,
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  /// 정보 알림 Dialog
  static Future<void> info({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "확인",
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _WavizDialogWidget<void>(
        title: title,
        message: message,
        actions: [
          _DialogAction(
            text: confirmText,
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm?.call();
            },
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  /// 확인/취소 Dialog
  static Future<bool?> confirm({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "확인",
    String cancelText = "취소",
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _WavizDialogWidget<bool>(
        title: title,
        message: message,
        actions: [
          _DialogAction(
            text: cancelText,
            onPressed: () => Navigator.of(dialogContext).pop(false),
            isPrimary: false,
          ),
          _DialogAction(
            text: confirmText,
            onPressed: () => Navigator.of(dialogContext).pop(true),
            isPrimary: true,
            isDestructive: isDestructive,
          ),
        ],
      ),
    );
  }

  /// 로그인 필요 Dialog
  static Future<bool?> loginRequired({
    required BuildContext context,
    String title = "로그인 필요",
    String message = "로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?",
    String confirmText = "로그인",
    String cancelText = "취소",
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _WavizDialogWidget<bool>(
        title: title,
        message: message,
        actions: [
          _DialogAction(
            text: cancelText,
            onPressed: () => Navigator.of(dialogContext).pop(false),
            isPrimary: false,
          ),
          _DialogAction(
            text: confirmText,
            onPressed: () => Navigator.of(dialogContext).pop(true),
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  /// 입력 Dialog (Switch 포함)
  static Future<bool?> switchInput({
    required BuildContext context,
    required String title,
    required String message,
    required String switchLabel,
    required String switchSubtitle,
    required bool initialValue,
    String confirmText = "저장",
    String cancelText = "취소",
  }) {
    bool switchValue = initialValue;

    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => _WavizDialogWidget(
          title: title,
          message: message,
          content: _SwitchTile(
            title: switchLabel,
            subtitle: switchSubtitle,
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
          actions: [
            _DialogAction(
              text: cancelText,
              onPressed: () => Navigator.of(dialogContext).pop(null),
              isPrimary: false,
            ),
            _DialogAction(
              text: confirmText,
              onPressed: () => Navigator.of(dialogContext).pop(switchValue),
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }

  /// 로딩 Dialog
  static void showLoading({
    required BuildContext context,
    String message = "처리 중...",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (context) => PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CupertinoActivityIndicator(
                    color: AppColors.primary,
                    radius: 14,
                  ),
                ),
                const Gap(16),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.wavizGray[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 로딩 Dialog 닫기
  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}

/// Dialog Action 모델
class _DialogAction {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isDestructive;

  const _DialogAction({
    required this.text,
    required this.onPressed,
    required this.isPrimary,
    this.isDestructive = false,
  });
}

/// Dialog Widget 구현
class _WavizDialogWidget<T> extends StatelessWidget {
  final String title;
  final String message;
  final Widget? content;
  final List<_DialogAction> actions;

  const _WavizDialogWidget({
    required this.title,
    required this.message,
    this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 제목
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            
            const Gap(12),

            // 메시지
            Text(
              message,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.wavizGray[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            // 추가 컨텐츠 (있는 경우)
            if (content != null) ...[
              const Gap(20),
              content!,
            ],

            const Gap(24),

            // 액션 버튼들
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    if (actions.length == 1) {
      // 단일 버튼
      return SizedBox(
        width: double.infinity,
        child: _buildActionButton(actions.first),
      );
    } else if (actions.length == 2) {
      // 두 개 버튼 (가로 배치)
      return Row(
        children: [
          Expanded(child: _buildActionButton(actions[0])),
          const Gap(12),
          Expanded(child: _buildActionButton(actions[1])),
        ],
      );
    } else {
      // 여러 버튼 (세로 배치)
      return Column(
        children: actions.asMap().entries.map((entry) {
          final index = entry.key;
          final action = entry.value;
          return Padding(
            padding: index > 0 ? const EdgeInsets.only(top: 8) : EdgeInsets.zero,
            child: SizedBox(
              width: double.infinity,
              child: _buildActionButton(action),
            ),
          );
        }).toList(),
      );
    }
  }

  Widget _buildActionButton(_DialogAction action) {
    if (action.isPrimary) {
      return ElevatedButton(
        onPressed: action.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: action.isDestructive ? Colors.red : AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          action.text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: action.onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: action.isDestructive 
                ? Colors.red.withValues(alpha: 0.3)
                : AppColors.wavizGray[300]!,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          action.text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: action.isDestructive 
                ? Colors.red 
                : AppColors.wavizGray[700],
          ),
        ),
      );
    }
  }
}

/// Switch Tile 위젯
class _SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.wavizGray[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const Gap(4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.wavizGray[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeTrackColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
