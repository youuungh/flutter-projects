import 'package:waviz_client/data/model/category/category_model.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryItemModel model) {
    return CategoryEntity(
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
      image: model.image,
    );
  }

  static List<CategoryEntity> toEntityList(List<CategoryItemModel> models) {
    return models.map(toEntity).toList();
  }
}