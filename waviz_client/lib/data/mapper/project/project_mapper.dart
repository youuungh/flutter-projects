import 'package:waviz_client/data/model/project/project_model.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';

class ProjectMapper {
  static ProjectEntity toEntity(ProjectItemModel model) {
    return ProjectEntity(
      id: model.id,
      categoryId: model.categoryId,
      projectTypeId: model.projectTypeId,
      projectClass: model.projectClass,
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
      projectImage: model.projectImage,
    );
  }

  static ProjectItemModel toModel(ProjectEntity entity) {
    return ProjectItemModel(
      id: entity.id,
      categoryId: entity.categoryId,
      projectTypeId: entity.projectTypeId,
      projectClass: entity.projectClass,
      userId: entity.userId,
      title: entity.title,
      owner: entity.owner,
      price: entity.price,
      thumbnail: entity.thumbnail,
      deadline: entity.deadline,
      description: entity.description,
      waitlistCount: entity.waitlistCount,
      totalFundedCount: entity.totalFundedCount,
      totalFunded: entity.totalFunded,
      isOpen: entity.isOpen,
      category: entity.category,
      type: entity.type,
      image: entity.image,
      projectImage: entity.projectImage,
    );
  }

  static List<ProjectEntity> toEntityList(List<ProjectItemModel> models) {
    return models.map(toEntity).toList();
  }
}
