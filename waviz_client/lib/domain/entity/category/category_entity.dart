import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

part 'category_entity.g.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryEntity({
    int? id,
    int? categoryId,
    int? projectTypeId,
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
  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
}
