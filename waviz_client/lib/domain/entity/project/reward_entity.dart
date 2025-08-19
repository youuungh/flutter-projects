import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_entity.freezed.dart';
part 'reward_entity.g.dart';

@freezed
abstract class RewardEntity with _$RewardEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RewardEntity({
    int? id,
    int? projectId,
    String? imageUrl,
    String? title,
    int? price,
    String? description,
    @Default([]) List<int> imageRaw,
  }) = _RewardEntity;

  factory RewardEntity.fromJson(Map<String, dynamic> json) =>
      _$RewardEntityFromJson(json);
}
