import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/data/repository/category/category_repository_impl.dart';
import 'package:waviz_client/domain/entity/category/category_entity.dart';
import 'package:waviz_client/domain/repository/category/category_repository.dart';

part 'fetch_category_projects.g.dart';

class FetchCategoryProjectsUseCase {
  final CategoryRepository _repository;

  FetchCategoryProjectsUseCase(this._repository);

  Future<List<CategoryEntity>> call(String categoryId) async {
    try {
      return await _repository.getProjectsByCategoryId(categoryId);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw CategoryConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw CategoryConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class FetchCategoryProjectsByTypeUseCase {
  final CategoryRepository _repository;

  FetchCategoryProjectsByTypeUseCase(this._repository);

  Future<List<CategoryEntity>> call(String categoryId, String projectTypeId) async {
    try {
      return await _repository.getProjectsByProjectType(categoryId, projectTypeId);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw CategoryConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw CategoryConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

@riverpod
FetchCategoryProjectsUseCase fetchCategoryProjectsUseCase(Ref ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return FetchCategoryProjectsUseCase(repository);
}

@riverpod
FetchCategoryProjectsByTypeUseCase fetchCategoryProjectsByTypeUseCase(Ref ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return FetchCategoryProjectsByTypeUseCase(repository);
}

class CategoryConnectionError implements Exception {
  final DioException dioException;
  CategoryConnectionError(this.dioException);
  
  @override
  String toString() => 'Category Connection Error: ${dioException.message}';
}

class CategoryConnectionTimeoutError implements Exception {
  final DioException dioException;
  CategoryConnectionTimeoutError(this.dioException);
  
  @override
  String toString() => 'Category Connection Timeout: ${dioException.message}';
}
