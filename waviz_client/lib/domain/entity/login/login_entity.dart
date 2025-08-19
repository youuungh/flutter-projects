import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

part 'login_entity.g.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    int? id,
    required String email,
    required String password,
    String? username,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);
}
