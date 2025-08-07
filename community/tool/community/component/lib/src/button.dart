import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/gen/gen.dart';
import 'package:tool_community_theme/theme.dart';

class CommunityCardButton extends StatelessWidget {
  const CommunityCardButton({
    required this.icon,
    required this.text,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });

  factory CommunityCardButton.like(
    BuildContext context, {
    required VoidCallback onTap,
    int count = 0,
    bool isSelected = false,
  }) {
    return CommunityCardButton(
      icon: CommunityIcon.favorite(
        color: isSelected ? ColorName.mainRed : context.colorScheme.gray500,
      ),
      text: count > 0 ? count.toDecimal() : '좋아요',
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  factory CommunityCardButton.comment(
    BuildContext context, {
    required VoidCallback onTap,
    int count = 0,
  }) {
    return CommunityCardButton(
      icon: CommunityIcon.chatBubble(
        color: context.colorScheme.gray500,
      ),
      text: count > 0 ? count.toDecimal() : '댓글',
      onTap: onTap,
    );
  }

  factory CommunityCardButton.view(
    BuildContext context, {
    required VoidCallback onTap,
    int count = 0,
  }) {
    return CommunityCardButton(
      icon: CommunityIcon.visibility(
        color: context.colorScheme.gray500,
      ),
      text: count > 0 ? count.toDecimal() : '조회수',
      onTap: onTap,
    );
  }

  final Widget icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 42.0,
        child: ColoredBox(
          color: context.colorScheme.bg2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 5.0,
              ),
              Flexible(
                child: Text(
                  text,
                  style: isSelected
                      ? context.textTheme.default14Medium.copyWith(
                          color: ColorName.mainRed,
                        )
                      : context.textTheme.default14Regular.copyWith(
                          color: context.colorScheme.gray400,
                        ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityWriteButton extends StatelessWidget {
  const CommunityWriteButton({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 44.0,
        decoration: BoxDecoration(
          color: ColorName.writingButton,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 15.0,
            ),
            CommunityIcon.edit(
              color: ColorName.white,
            ),
            const SizedBox(
              width: 3.0,
            ),
            Flexible(
              child: Text(
                '글쓰기',
                style: context.textTheme.default14Medium.copyWith(
                  color: ColorName.white,
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
