import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    int? id,
    String? email,
    String? password,
    String? username,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
