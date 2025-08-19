import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/data/repository/project/project_repository_impl.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/entity/project/reward_entity.dart';
import 'package:waviz_client/domain/repository/project/project_repository.dart';

part 'project_use_cases.g.dart';

class FetchProjectByIdUseCase {
  final ProjectRepository _repository;

  FetchProjectByIdUseCase(this._repository);

  Future<List<ProjectEntity>> call(String projectId) async {
    try {
      return await _repository.getProjectByProjectId(projectId);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw ProjectConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw ProjectConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class CreateProjectUseCase {
  final ProjectRepository _repository;

  CreateProjectUseCase(this._repository);

  Future<bool> call(ProjectEntity projectEntity) async {
    try {
      final result = await _repository.createProject(projectEntity);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw ProjectConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw ProjectConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class CreateProjectRewardUseCase {
  final ProjectRepository _repository;

  CreateProjectRewardUseCase(this._repository);

  Future<bool> call(String projectId, RewardEntity rewardEntity) async {
    try {
      final result = await _repository.createProjectReward(projectId, rewardEntity);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw ProjectConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw ProjectConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class UpdateProjectOpenStateUseCase {
  final ProjectRepository _repository;

  UpdateProjectOpenStateUseCase(this._repository);

  Future<bool> call(String projectId, ProjectEntity projectEntity) async {
    try {
      final result = await _repository.updateProjectOpenState(projectId, projectEntity);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw ProjectConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw ProjectConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

class DeleteProjectUseCase {
  final ProjectRepository _repository;

  DeleteProjectUseCase(this._repository);

  Future<bool> call(String projectId) async {
    try {
      final result = await _repository.deleteProject(projectId);
      return result.status == "ok";
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw ProjectConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw ProjectConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

@riverpod
FetchProjectByIdUseCase fetchProjectByIdUseCase(Ref ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return FetchProjectByIdUseCase(repository);
}

@riverpod
CreateProjectUseCase createProjectUseCase(Ref ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return CreateProjectUseCase(repository);
}

@riverpod
CreateProjectRewardUseCase createProjectRewardUseCase(Ref ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return CreateProjectRewardUseCase(repository);
}

@riverpod
UpdateProjectOpenStateUseCase updateProjectOpenStateUseCase(Ref ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return UpdateProjectOpenStateUseCase(repository);
}

@riverpod
DeleteProjectUseCase deleteProjectUseCase(Ref ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return DeleteProjectUseCase(repository);
}

class ProjectConnectionError implements Exception {
  final DioException dioException;
  ProjectConnectionError(this.dioException);
  
  @override
  String toString() => 'Project Connection Error: ${dioException.message}';
}

class ProjectConnectionTimeoutError implements Exception {
  final DioException dioException;
  ProjectConnectionTimeoutError(this.dioException);
  
  @override
  String toString() => 'Project Connection Timeout: ${dioException.message}';
}
