import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/project_type.dart';
import 'package:waviz_client/data/data_sources/remote/category/category_api.dart';
import 'package:waviz_client/data/data_sources/remote/category/category_api_service.dart';
import 'package:waviz_client/data/mapper/category/category_mapper.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';
import 'package:waviz_client/domain/repository/category/category_repository.dart';

part 'category_repository_impl.g.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiClient categoryApiService;

  CategoryRepositoryImpl(this.categoryApiService);

  @override
  Future<List<CategoryEntity>> getCategoryProjects() async {
    final result = await categoryApiService.getProjectsByCategoryId(null);
    return CategoryMapper.toEntityList(result.projects);
  }

  @override
  Future<List<CategoryEntity>> getProjectsByCategoryId(String categoryId) async {
    final result = await categoryApiService.getProjectsByCategoryId(categoryId);
    return CategoryMapper.toEntityList(result.projects);
  }

  @override
  Future<List<CategoryEntity>> getProjectsByProjectType(
    String categoryId,
    String projectTypeId,
  ) async {
    final result = await categoryApiService.getProjectsByProjectType(
      categoryId,
      projectTypeId,
    );
    return CategoryMapper.toEntityList(result.projects);
  }

  @override
  List<ProjectType> getProjectsTypes() {
    List<ProjectType> defaultTypes = [
      ProjectType(id: 1, type: "테크·가전", imagePath: "assets/icons/type/1.svg"),
      ProjectType(id: 2, type: "패션", imagePath: "assets/icons/type/2.svg"),
      ProjectType(id: 3, type: "뷰티", imagePath: "assets/icons/type/3.svg"),
      ProjectType(id: 4, type: "홈·리빙", imagePath: "assets/icons/type/4.svg"),
      ProjectType(
        id: 5,
        type: "스포츠·아웃도어",
        imagePath: "assets/icons/type/5.svg",
      ),
      ProjectType(id: 6, type: "푸드", imagePath: "assets/icons/type/6.svg"),
      ProjectType(id: 7, type: "도서·전자책", imagePath: "assets/icons/type/7.svg"),
      ProjectType(id: 8, type: "클래스", imagePath: "assets/icons/type/8.svg"),
    ];

    return [
      ProjectType(id: 0, type: "전체", imagePath: "assets/icons/type/all.svg"),
      ProjectType(
        id: 0,
        type: "BEST 펀딩",
        imagePath: "assets/icons/type/best.svg",
      ),
      ...defaultTypes,
    ];
  }
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final service = ref.watch(categoryApiServiceProvider);
  return CategoryRepositoryImpl(service);
}
