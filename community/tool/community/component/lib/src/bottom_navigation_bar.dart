import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

enum CommunityNavigationType {
  home(title: '홈'),
  write(title: '글쓰기'),
  message(title: '메시지'),
  my(title: '마이페이지');

  const CommunityNavigationType({required this.title});

  final String title;
}

class CommunityBottomNavigationItem {
  const CommunityBottomNavigationItem({required this.type});

  factory CommunityBottomNavigationItem.home() {
    return const CommunityBottomNavigationItem(
      type: CommunityNavigationType.home,
    );
  }

  factory CommunityBottomNavigationItem.message() {
    return const CommunityBottomNavigationItem(
      type: CommunityNavigationType.message,
    );
  }

  factory CommunityBottomNavigationItem.my() {
    return const CommunityBottomNavigationItem(
      type: CommunityNavigationType.my,
    );
  }

  final CommunityNavigationType type;
}

class CommunityBottomNavigationBar extends StatelessWidget {
  const CommunityBottomNavigationBar({
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
    super.key,
  });

  final List<CommunityBottomNavigationItem> items;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommunityDivider.horizontal(),
        SizedBox(
          height:
              context.navigationBarThemeData.height +
              MediaQuery.viewPaddingOf(context).bottom,
          child: ColoredBox(
            color: context.colorScheme.darkBlack,
            child: Padding(
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: MediaQuery.viewPaddingOf(context).bottom,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  final isSelected = index == currentIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onTap.call(index),
                      behavior: HitTestBehavior.translucent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommunityNavigationTypeIcon(
                            type: item.type,
                            isSelected: isSelected,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            item.type.title,
                            style: isSelected
                                ? context.textTheme.default11Regular.copyWith(
                                    color: context.colorScheme.gray100,
                                  )
                                : context.textTheme.default11Light.copyWith(
                                    color: context.colorScheme.gray200,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommunityNavigationTypeIcon extends StatelessWidget {
  const CommunityNavigationTypeIcon({
    required this.type,
    this.isSelected = false,
    super.key,
  });

  final CommunityNavigationType type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.white;

    if (isSelected) {
      return switch (type) {
        CommunityNavigationType.home => CommunityIcon.homeOn(color: color),
        CommunityNavigationType.write => CommunityIcon.edit(color: color),
        CommunityNavigationType.message => CommunityIcon.messageOn(
          color: color,
        ),
        CommunityNavigationType.my => CommunityIcon.personOn(color: color),
      };
    }

    return switch (type) {
      CommunityNavigationType.home => CommunityIcon.homeOff(color: color),
      CommunityNavigationType.write => CommunityIcon.edit(color: color),
      CommunityNavigationType.message => CommunityIcon.messageOff(
        color: color,
      ),
      CommunityNavigationType.my => CommunityIcon.personOff(color: color),
    };
  }
}

class CommunityChatBottomNavigationBar extends StatefulWidget {
  const CommunityChatBottomNavigationBar({
    required this.onSend,
    super.key,
    this.hintText = '',
    this.minLines = 1,
    this.maxLines = 4,
  });

  final String hintText;
  final int minLines;
  final int maxLines;
  final void Function(String) onSend;

  @override
  State<CommunityChatBottomNavigationBar> createState() =>
      _CommunityChatBottomNavigationBarState();
}

class _CommunityChatBottomNavigationBarState
    extends State<CommunityChatBottomNavigationBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final threshold = MediaQuery.viewPaddingOf(context).bottom + 50.0;
    final bottomPadding = MediaQuery.viewPaddingOf(context).bottom;
    final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    final hasKeyboard = MediaQuery.viewInsetsOf(context).bottom > threshold;

    return Container(
      height: 82.0 + (hasKeyboard ? keyboardHeight : bottomPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.bg2,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: hasKeyboard ? keyboardHeight : bottomPadding,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 17.0,
          ),
          CommunityIcon.imagesMode(
            color: context.colorScheme.gray400,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: CoreTextField(
              controller: _controller,
              cursorColor: context.colorScheme.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: context.textTheme.default15SemiBold.copyWith(
                  color: context.colorScheme.gray600,
                ),
              ),
              style: context.textTheme.default15SemiBold.copyWith(
                color: context.colorScheme.gray200,
              ),
              keyboardAppearance: context.colorScheme.brightness,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          GestureDetector(
            onTap: () {
              widget.onSend.call(_controller.text);
              _controller.clear();
            },
            behavior: HitTestBehavior.translucent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.gray200,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '전송',
                  style: context.textTheme.default15SemiBold.copyWith(
                    color: context.colorScheme.gray200,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
