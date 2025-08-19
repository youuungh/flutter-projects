import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_type.freezed.dart';
part 'project_type.g.dart';

@freezed
abstract class ProjectType with _$ProjectType {
  const factory ProjectType({
    int? id,
    String? type,
    String? created,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}