// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => _LoginEntity(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String,
  password: json['password'] as String,
  username: json['username'] as String?,
);

Map<String, dynamic> _$LoginEntityToJson(_LoginEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };
