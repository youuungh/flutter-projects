import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class CommunityAppBar extends AppBar {
  CommunityAppBar({
    required BuildContext context,
    super.key,
    super.leading,
    super.title,
    super.automaticallyImplyLeading = false,
    super.actions,
    super.leadingWidth = 41.0,
    super.elevation = 0,
    double? titleSpacing,
    double? toolbarHeight,
    Color? backgroundColor,
    bool? centerTitle,
    super.bottom,
  }) : super(
         scrolledUnderElevation: 0,
         titleSpacing: titleSpacing ?? context.appBarTheme.titleSpacing,
         backgroundColor:
             backgroundColor ?? context.appBarTheme.backgroundColor,
         centerTitle: centerTitle ?? context.appBarTheme.centerTitle,
         toolbarHeight: toolbarHeight ?? context.appBarTheme.toolbarHeight,
         systemOverlayStyle: context.appBarTheme.systemOverlayStyle,
       );
}

class CommunityAppBarTitle extends StatelessWidget {
  const CommunityAppBarTitle({
    required this.title,
    this.leading,
    this.trailing,
    super.key,
  });

  factory CommunityAppBarTitle.simple(
    BuildContext context, {
    required String text,
  }) {
    return CommunityAppBarTitle(
      title: Text(
        text,
        style: context.textTheme.default17Regular.copyWith(
          color: context.appBarTheme.primaryColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  factory CommunityAppBarTitle.logo(BuildContext context) {
    return CommunityAppBarTitle(
      title: Text(
        'Community',
        style: context.textTheme.poppins18Bold.copyWith(
          color: context.colorScheme.gray600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) leading!,
        Flexible(child: title),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class CommunityAppBarBackButton extends StatelessWidget {
  const CommunityAppBarBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) {
          onTap!.call();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: 41.0,
        padding: const EdgeInsets.only(right: 5.0),
        alignment: Alignment.centerRight,
        child: CommunityIcon.arrowBack(color: context.colorScheme.gray300),
      ),
    );
  }
}

class CommunityAppBarTextButton extends StatelessWidget {
  const CommunityAppBarTextButton({
    required this.text,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.color,
    super.key,
  });

  final String text;
  final EdgeInsets padding;
  final Alignment alignment;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap.call,
      child: SizedBox(
        width: 56.0,
        child: Align(
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: context.textTheme.default15Medium.copyWith(color: color),
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityAppBarIconAction extends StatelessWidget {
  const CommunityAppBarIconAction({required this.icon, this.onTap, super.key});

  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap?.call(),
      child: SizedBox(width: 39.0, child: Center(child: icon)),
    );
  }
}
