import 'package:waviz_client/data/model/project/reward_model.dart';
import 'package:waviz_client/domain/entity/project/reward_entity.dart';

class RewardMapper {
  static RewardEntity toEntity(RewardItemModel model) {
    return RewardEntity(
      id: model.id,
      projectId: model.projectId,
      imageUrl: model.imageUrl,
      title: model.title,
      price: model.price,
      description: model.description,
      imageRaw: model.imageRaw,
    );
  }

  static RewardItemModel toModel(RewardEntity entity) {
    return RewardItemModel(
      id: entity.id,
      projectId: entity.projectId,
      imageUrl: entity.imageUrl,
      title: entity.title,
      price: entity.price,
      description: entity.description,
      imageRaw: entity.imageRaw,
    );
  }

  static List<RewardEntity> toEntityList(List<RewardItemModel> models) {
    return models.map(toEntity).toList();
  }
}
