import 'package:waviz_client/data/model/home/home_model.dart';
import 'package:waviz_client/domain/entity/home/home_entity.dart';

class HomeMapper {
  static HomeEntity toEntity(HomeItemModel model) {
    return HomeEntity(
      id: model.id,
      categoryId: model.categoryId,
      projectTypeId: model.projectTypeId,
      userId: model.userId,
      title: model.title,
      owner: model.owner,
      price: model.price,
      thumbnail: model.thumbnail,
      deadline: model.deadline,
      description: model.description,
      waitlistCount: model.waitlistCount,
      totalFundedCount: model.totalFundedCount,
      totalFunded: model.totalFunded,
      isOpen: model.isOpen,
      category: model.category,
      type: model.type,
    );
  }

  static List<HomeEntity> toEntityList(List<HomeItemModel> models) {
    return models.map(toEntity).toList();
  }
}