import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/domain/entity/login/login_entity.dart';

abstract class LoginRepository {
  Future<ResponseModel> signUp(LoginEntity loginEntity);
  Future<ResponseModel?> signIn(LoginEntity loginEntity);
  Future<ResponseModel> checkEmail(LoginEntity loginEntity);
}
