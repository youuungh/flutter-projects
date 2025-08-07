import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';

class WritePostViewModel extends ValueNotifier<Post?> {
  WritePostViewModel(this._createPostUseCase) : super(null);
  final CreatePostUseCase _createPostUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> load() async {
    final Post newValue = Post.empty();
    value = newValue;
  }

  void update({String? channel, String? title, String? content}) {
    if (value == null) return;

    final Post prevData = value!;
    final Post newData = prevData.copyWith(
      channel: channel ?? prevData.channel,
      title: title ?? prevData.title,
      content: content ?? prevData.content,
    );

    value = newData;
  }

  Future<void> publish() async {
    if (value == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final CreatePostParams params = CreatePostParams(
        channel: value!.channel,
        title: value!.title,
        content: value!.content,
      );
      final Post newValue = await _createPostUseCase.execute(params);
      _isLoading = false;
      value = newValue;
    } catch (ignore) {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class WriteMyViewModel extends ValueNotifier<User?> {
  final GetMyUseCase _getMyUseCase;

  WriteMyViewModel(this._getMyUseCase) : super(null);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    try {
      final User newValue = await _getMyUseCase.execute();
      _isLoading = false;
      value = newValue;
    } catch (ignore) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
