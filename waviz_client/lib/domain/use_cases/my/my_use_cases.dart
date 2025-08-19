import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/data/repository/my/my_repository_impl.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/repository/my/my_repository.dart';

part 'my_use_cases.g.dart';

class FetchUserProjectsUseCase {
  final MyRepository _repository;

  FetchUserProjectsUseCase(this._repository);

  Future<List<ProjectEntity>> call(String userId) async {
    try {
      return await _repository.getProjectsByUserId(userId);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw MyConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw MyConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class UpdateUserProjectUseCase {
  final MyRepository _repository;

  UpdateUserProjectUseCase(this._repository);

  Future<bool> call(String projectId, ProjectEntity projectEntity) async {
    try {
      final result = await _repository.updateProjectOpenState(projectId, projectEntity);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw MyConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw MyConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class DeleteUserProjectUseCase {
  final MyRepository _repository;

  DeleteUserProjectUseCase(this._repository);

  Future<bool> call(String projectId) async {
    try {
      final result = await _repository.deleteProject(projectId);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw MyConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw MyConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

@riverpod
FetchUserProjectsUseCase fetchUserProjectsUseCase(Ref ref) {
  final repository = ref.watch(myRepositoryProvider);
  return FetchUserProjectsUseCase(repository);
}

@riverpod
UpdateUserProjectUseCase updateUserProjectUseCase(Ref ref) {
  final repository = ref.watch(myRepositoryProvider);
  return UpdateUserProjectUseCase(repository);
}

@riverpod
DeleteUserProjectUseCase deleteUserProjectUseCase(Ref ref) {
  final repository = ref.watch(myRepositoryProvider);
  return DeleteUserProjectUseCase(repository);
}

class MyConnectionError implements Exception {
  final DioException dioException;
  MyConnectionError(this.dioException);
  
  @override
  String toString() => 'My Connection Error: ${dioException.message}';
}

class MyConnectionTimeoutError implements Exception {
  final DioException dioException;
  MyConnectionTimeoutError(this.dioException);
  
  @override
  String toString() => 'My Connection Timeout: ${dioException.message}';
}
