import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/data/repository/login/login_repository_impl.dart';
import 'package:waviz_client/domain/entity/login/login_entity.dart';
import 'package:waviz_client/domain/repository/login/login_repository.dart';

part 'check_email_use_case.g.dart';

class CheckEmailUseCase {
  final LoginRepository _repository;

  CheckEmailUseCase(this._repository);

  Future<bool> call(String email) async {
    try {
      final loginEntity = LoginEntity(email: email, password: '');
      final result = await _repository.checkEmail(loginEntity);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw LoginConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw LoginConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

@riverpod
CheckEmailUseCase checkEmailUseCase(Ref ref) {
  final repository = ref.watch(loginRepositoryProvider);
  return CheckEmailUseCase(repository);
}

class LoginConnectionError implements Exception {
  final DioException dioException;
  LoginConnectionError(this.dioException);
  
  @override
  String toString() => 'Login Connection Error: ${dioException.message}';
}

class LoginConnectionTimeoutError implements Exception {
  final DioException dioException;
  LoginConnectionTimeoutError(this.dioException);
  
  @override
  String toString() => 'Login Connection Timeout: ${dioException.message}';
}
