import 'package:flutter/material.dart';
import 'package:tool_community_theme/gen/gen.dart';
import 'package:tool_community_theme/theme.dart';

class CommunityDialog extends StatelessWidget {
  const CommunityDialog({
    required this.title,
    required this.buttons,
    super.key,
    this.buttonSpacing,
    this.barrierDismissible = true,
  });

  final Widget title;
  final double? buttonSpacing;
  final List<Widget> buttons;
  final bool barrierDismissible;

  static Future<void> show(
    BuildContext context, {
    required String title,
    String confirmLabel = '확인',
    VoidCallback? onConfirm,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showRich(
      context,
      title: CommunityDialogTitle(title),
      buttons: [
        CommunityDialogButton.confirm(
          context,
          text: confirmLabel,
          onTap: () {
            Navigator.of(context).pop();

            onConfirm?.call();
          },
        ),
      ],
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showConfirm(
    BuildContext context, {
    required String title,
    required VoidCallback onConfirm,
    String confirmLabel = '확인',
    String cancelLabel = '취소',
    VoidCallback? onCancel,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showRich(
      context,
      title: CommunityDialogTitle(title),
      buttons: [
        CommunityDialogButton.cancel(
          context,
          text: cancelLabel,
          onTap: () {
            Navigator.of(context).pop();

            onCancel?.call();
          },
        ),
        CommunityDialogButton.confirm(
          context,
          text: confirmLabel,
          onTap: () {
            Navigator.of(context).pop();

            onConfirm.call();
          },
        ),
      ],
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showRich(
    BuildContext context, {
    required Widget title,
    required List<Widget> buttons,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      builder: (context) => CommunityDialog(
        title: title,
        buttons: buttons,
        barrierDismissible: barrierDismissible,
      ),
      barrierColor:
          barrierColor ?? context.colorScheme.black.withValues(alpha: 0.4),
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 277.0,
        decoration: BoxDecoration(
          color: context.dialogTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Flexible(child: title),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),
              Row(
                children: List.generate(
                  buttons.length,
                  (index) => Expanded(child: buttons[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (barrierDismissible) {
      return PopScope(child: child);
    }

    return child;
  }
}

class CommunityDialogTitle extends StatelessWidget {
  const CommunityDialogTitle(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.dialogTheme.titleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class CommunityDialogButton extends StatelessWidget {
  const CommunityDialogButton({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    super.key,
  });

  factory CommunityDialogButton.cancel(
    BuildContext context, {
    required VoidCallback onTap,
    String text = '취소',
  }) {
    return CommunityDialogButton(
      text: Text(
        text,
        style: context.dialogTheme.cancelTextStyle,
        textAlign: TextAlign.center,
      ),
      backgroundColor: context.dialogTheme.cancelBackgroundColor,
      onTap: onTap,
    );
  }

  factory CommunityDialogButton.confirm(
    BuildContext context, {
    required VoidCallback onTap,
    String text = '확인',
  }) {
    return CommunityDialogButton(
      text: Text(
        text,
        style: context.dialogTheme.confirmTextStyle,
        textAlign: TextAlign.center,
      ),
      backgroundColor: context.dialogTheme.confirmBackgroundColor,
      onTap: onTap,
    );
  }

  final Widget text;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 43.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [text],
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityLoadingDialog extends StatelessWidget {
  const CommunityLoadingDialog({super.key});

  static Future<void> show(
    BuildContext context, {
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: context.colorScheme.black.withValues(alpha: 0.6),
      builder: (context) => const CommunityLoadingDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: context.dialogTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: ColorName.blue,
            strokeWidth: 3.0,
          ),
        ),
      ),
    );
  }
}
