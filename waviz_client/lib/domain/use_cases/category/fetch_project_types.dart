import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/project_type.dart';
import 'package:waviz_client/data/repository/category/category_repository_impl.dart';
import 'package:waviz_client/domain/repository/category/category_repository.dart';

part 'fetch_project_types.g.dart';

class FetchProjectTypesUseCase {
  final CategoryRepository _repository;

  FetchProjectTypesUseCase(this._repository);

  Future<List<ProjectType>> call() async {
    return _repository.getProjectsTypes();
  }
}

@riverpod
FetchProjectTypesUseCase fetchProjectTypesUseCase(Ref ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return FetchProjectTypesUseCase(repository);
}
