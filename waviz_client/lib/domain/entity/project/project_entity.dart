import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_entity.freezed.dart';
part 'project_entity.g.dart';

@freezed
abstract class ProjectEntity with _$ProjectEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjectEntity({
    int? id,
    int? categoryId,
    int? projectTypeId,
    String? projectClass,
    String? userId,
    String? title,
    String? owner,
    int? price,
    String? thumbnail,
    String? deadline,
    String? description,
    int? waitlistCount,
    int? totalFundedCount,
    int? totalFunded,
    String? isOpen,
    String? category,
    String? type,
    @Default([]) List<int> image,
    @Default([]) List<int> projectImage,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);
}
