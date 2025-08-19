import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/data/repository/home/home_repository_impl.dart';
import 'package:waviz_client/domain/entity/home/home_entity.dart';
import 'package:waviz_client/domain/repository/home/home_repository.dart';

part 'fetch_home_projects.g.dart';

class FetchHomeProjectsUseCase {
  final HomeRepository _repository;

  FetchHomeProjectsUseCase(this._repository);

  Future<List<HomeEntity>> call() async {
    try {
      return await _repository.getHomeProjects();
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          throw ConnectionError(error);
        case DioExceptionType.connectionTimeout:
          throw ConnectionTimeoutError(error);
        default:
          rethrow;
      }
    }
  }
}

@riverpod
FetchHomeProjectsUseCase fetchHomeProjectsUseCase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return FetchHomeProjectsUseCase(repository);
}

class ConnectionError implements Exception {
  final DioException dioException;

  ConnectionError(this.dioException);

  @override
  String toString() => 'Connection Error: ${dioException.message}';
}

class ConnectionTimeoutError implements Exception {
  final DioException dioException;

  ConnectionTimeoutError(this.dioException);

  @override
  String toString() => 'Connection Timeout: ${dioException.message}';
}
