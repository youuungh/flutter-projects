import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waviz_client/core/enum/enum_shared_pref_key.dart';
import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/data/data_sources/local/shared_pref_provider.dart';
import 'package:waviz_client/domain/entity/login/login_entity.dart';
import 'package:waviz_client/domain/use_cases/login/check_email_use_case.dart';
import 'package:waviz_client/domain/use_cases/login/sign_in_use_case.dart';
import 'package:waviz_client/domain/use_cases/login/sign_up_use_case.dart';

part 'login_notifier.freezed.dart';
part 'login_notifier.g.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLogin,
    int? userid,
    String? email,
    String? password,
    String? username,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _LoginState;

  factory LoginState.init() {
    return LoginState(
      isLogin: false,
      userid: 0,
      email: "",
      password: "",
      username: "",
      isLoading: false,
    );
  }
}

@Riverpod(keepAlive: true)
class LoginNotifier extends _$LoginNotifier {
  late SignUpUseCase _signUpUseCase;
  late SignInUseCase _signInUseCase;
  late CheckEmailUseCase _checkEmailUseCase;
  late SharedPreferences _prefs;

  @override
  LoginState build() {
    _signUpUseCase = ref.watch(signUpUseCaseProvider);
    _signInUseCase = ref.watch(signInUseCaseProvider);
    _checkEmailUseCase = ref.watch(checkEmailUseCaseProvider);
    _prefs = ref.watch(sharedPreferencesProvider);

    // 저장된 로그인 상태 복원하여 초기 상태로 반환
    return _getInitialState();
  }

  LoginState _getInitialState() {
    final isLogin = _prefs.getBool(EnumSharedPreferencesKey.isLogin.value) ?? false;
    if (isLogin) {
      final userId = _prefs.getInt(EnumSharedPreferencesKey.userId.value);
      final email = _prefs.getString(EnumSharedPreferencesKey.userEmail.value);
      final userName = _prefs.getString(EnumSharedPreferencesKey.userName.value);
      
      return LoginState(
        isLogin: true,
        userid: userId,
        email: email,
        username: userName,
        isLoading: false,
      );
    }
    return LoginState.init();
  }


  Future<void> _saveLoginState() async {
    await _prefs.setBool(EnumSharedPreferencesKey.isLogin.value, state.isLogin);
    
    if (state.isLogin) {
      if (state.userid != null) {
        await _prefs.setInt(EnumSharedPreferencesKey.userId.value, state.userid!);
      }
      if (state.email != null) {
        await _prefs.setString(EnumSharedPreferencesKey.userEmail.value, state.email!);
      }
      if (state.username != null) {
        await _prefs.setString(EnumSharedPreferencesKey.userName.value, state.username!);
      }
    }
  }

  Future<void> _clearLoginState() async {
    await _prefs.remove(EnumSharedPreferencesKey.isLogin.value);
    await _prefs.remove(EnumSharedPreferencesKey.userId.value);
    await _prefs.remove(EnumSharedPreferencesKey.userEmail.value);
    await _prefs.remove(EnumSharedPreferencesKey.userName.value);
  }

  Future<bool> signUp(String email, String password, String? username) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final loginEntity = LoginEntity(
        email: email,
        password: password,
        username: username,
      );
      
      final result = await _signUpUseCase.call(loginEntity);
      
      state = state.copyWith(isLoading: false);
      return result;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future<ResponseModel?> signIn(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final response = await _signInUseCase.call(email, password);

      if (response != null) {
        final data = LoginEntity.fromJson(jsonDecode(response.body ?? ""));
        state = state.copyWith(
          isLogin: true,
          userid: data.id,
          email: data.email,
          username: data.username,
          isLoading: false,
        );
        
        // SharedPreferences에 로그인 상태 저장
        await _saveLoginState();
      } else {
        state = state.copyWith(isLoading: false);
      }
      
      return response;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
      return null;
    }
  }

  Future<bool> checkEmail(String email) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      
      final result = await _checkEmailUseCase.call(email);
      
      state = state.copyWith(isLoading: false);
      return result;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
      return false;
    }
  }

  Future<bool> signOut() async {
    state = state.copyWith(
      isLogin: false,
      email: "",
      username: "",
      password: "",
      userid: 0,
      errorMessage: null,
    );
    
    // SharedPreferences에서 로그인 상태 삭제
    await _clearLoginState();
    return true;
  }
}
