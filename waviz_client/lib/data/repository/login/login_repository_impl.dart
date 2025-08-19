import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/data/data_sources/remote/login/login_api.dart';
import 'package:waviz_client/data/data_sources/remote/login/login_api_service.dart';
import 'package:waviz_client/data/mapper/login/login_mapper.dart';
import 'package:waviz_client/domain/entity/login/login_entity.dart';
import 'package:waviz_client/domain/repository/login/login_repository.dart';

part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiClient loginApiService;

  LoginRepositoryImpl(this.loginApiService);

  @override
  Future<ResponseModel> signUp(LoginEntity loginEntity) async {
    final loginModel = LoginMapper.toModel(loginEntity);
    return await loginApiService.signUp(loginModel);
  }

  @override
  Future<ResponseModel?> signIn(LoginEntity loginEntity) async {
    final loginModel = LoginMapper.toModel(loginEntity);
    final result = await loginApiService.signIn(loginModel);

    if (result.response.statusCode == 204) {
      return null;
    } else {
      return ResponseModel.fromJson(result.data);
    }
  }

  @override
  Future<ResponseModel> checkEmail(LoginEntity loginEntity) async {
    final loginModel = LoginMapper.toModel(loginEntity);
    return await loginApiService.checkEmail(loginModel);
  }
}

@riverpod
LoginRepository loginRepository(Ref ref) {
  final service = ref.watch(loginApiClientProvider);
  return LoginRepositoryImpl(service);
}
