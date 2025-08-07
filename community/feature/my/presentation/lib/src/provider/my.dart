import 'package:flutter/cupertino.dart';
import 'package:my_domain/domain.dart';

class MyViewModel extends ValueNotifier<User?> {
  MyViewModel(this._getMyPageUseCase) : super(null);

  final GetMyPageUseCase _getMyPageUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    try {
      final User result = await _getMyPageUseCase.execute();
      _isLoading = false;
      value = result;
    } catch (ignore) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
