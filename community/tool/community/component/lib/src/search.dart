import 'dart:async';

import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class CommunitySearchBar extends StatelessWidget {
  const CommunitySearchBar({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 38.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: context.colorScheme.darkGray,
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommunityIcon.search(color: context.colorScheme.gray400),
            const SizedBox(width: 5.0),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.default15Medium.copyWith(
                  color: context.colorScheme.gray400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityLoadingSearchBar extends StatelessWidget {
  const CommunityLoadingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      baseColor: context.colorScheme.gray800,
      highlightColor: context.colorScheme.gray900,
      child: Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: context.colorScheme.gray800,
          borderRadius: BorderRadius.circular(19.0),
        ),
      ),
    );
  }
}

class CommunitySearchTextField extends StatefulWidget {
  const CommunitySearchTextField({
    required this.onSearch,
    super.key,
    this.text = '',
    this.hintText = '',
    this.focusNode,
    this.autoFocus = false,
    this.debounceMilliseconds = 300,
  });

  final String text;
  final String hintText;
  final void Function(String) onSearch;
  final FocusNode? focusNode;
  final bool autoFocus;
  final int debounceMilliseconds;

  @override
  State<CommunitySearchTextField> createState() =>
      _CommunitySearchTextFieldState();
}

class _CommunitySearchTextFieldState extends State<CommunitySearchTextField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.text,
  );
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  late final ValueNotifier<String> _textNotifier = ValueNotifier<String>(
    widget.text,
  );

  Timer? _debounceTimer;

  @override
  void initState() {
    _controller.addListener(_changeText);
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_changeText)
      ..dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _textNotifier.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _changeText() {
    _updateText(_controller.text);

    _debounceTimer?.cancel();
    _debounceTimer = Timer(
      Duration(milliseconds: widget.debounceMilliseconds),
      _onSearch,
    );
  }

  void _updateText(String text) {
    if (_textNotifier.value == text) return;
    _textNotifier.value = text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CoreTextField(
            controller: _controller,
            focusNode: _focusNode,
            cursorColor: context.colorScheme.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: context.textTheme.default16Regular.copyWith(
                color: context.colorScheme.gray600,
              ),
            ),
            style: context.textTheme.default16Regular.copyWith(
              color: context.colorScheme.gray200,
            ),
            keyboardAppearance: context.colorScheme.brightness,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            onSubmitted: (value) => _onSearchComplete(),
            onEditingComplete: _onSearchComplete,
          ),
        ),
        const SizedBox(width: 10.0),
        ValueListenableBuilder<String>(
          valueListenable: _textNotifier,
          builder: (context, value, child) {
            if (value.isEmpty) return const SizedBox.shrink();
            return child!;
          },
          child: GestureDetector(
            onTap: () {
              _controller.clear();
              _debounceTimer?.cancel();
              _onSearch();
            },
            behavior: HitTestBehavior.translucent,
            child: CommunityIcon.cancel(color: context.colorScheme.gray200),
          ),
        ),
      ],
    );
  }

  void _onSearch() {
    final text = _textNotifier.value;
    widget.onSearch.call(text);
  }

  void _onSearchComplete() {
    _debounceTimer?.cancel();
    _hideKeyboard();
    _onSearch();
  }

  void _hideKeyboard() {
    _focusNode.unfocus();
  }
}
