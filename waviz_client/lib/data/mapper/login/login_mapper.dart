import 'package:waviz_client/data/model/login/login_model.dart';
import 'package:waviz_client/domain/entity/login/login_entity.dart';

class LoginMapper {
  static LoginEntity toEntity(LoginModel model) {
    return LoginEntity(
      id: model.id,
      email: model.email ?? '',
      password: model.password ?? '',
      username: model.username,
    );
  }

  static LoginModel toModel(LoginEntity entity) {
    return LoginModel(
      id: entity.id,
      email: entity.email,
      password: entity.password,
      username: entity.username,
    );
  }
}
