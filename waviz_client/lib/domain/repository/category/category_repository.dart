import 'package:waviz_client/core/model/project_type.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategoryProjects();
  Future<List<CategoryEntity>> getProjectsByCategoryId(String categoryId);
  Future<List<CategoryEntity>> getProjectsByProjectType(String categoryId, String projectTypeId);
  List<ProjectType> getProjectsTypes();
}
