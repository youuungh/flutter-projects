import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_entity.freezed.dart';

part 'home_entity.g.dart';

@freezed
abstract class HomeEntity with _$HomeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeEntity({
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
  }) = _HomeEntity;

  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeEntityFromJson(json);
}
