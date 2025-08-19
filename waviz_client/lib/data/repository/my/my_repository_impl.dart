import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/data/data_sources/remote/project/project_api.dart';
import 'package:waviz_client/data/data_sources/remote/project/project_api_service.dart';
import 'package:waviz_client/data/mapper/project/project_mapper.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/repository/my/my_repository.dart';

part 'my_repository_impl.g.dart';

class MyRepositoryImpl implements MyRepository {
  final ProjectApiClient projectService;

  MyRepositoryImpl(this.projectService);

  @override
  Future<ResponseModel> deleteProject(String id) async {
    final result = await projectService.deleteProject(id);
    return result;
  }

  @override
  Future<List<ProjectEntity>> getProjectsByUserId(String userId) async {
    final result = await projectService.getProjectByUserId(userId);
    return ProjectMapper.toEntityList(result.data);
  }

  @override
  Future<ResponseModel> updateProjectOpenState(String id, ProjectEntity projectEntity) async {
    final projectModel = ProjectMapper.toModel(projectEntity);
    final result = await projectService.updateProjectOpenState(id, projectModel);
    return result;
  }
}

@riverpod
MyRepository myRepository(Ref ref) {
  final projectService = ref.watch(projectApiServiceProvider);
  return MyRepositoryImpl(projectService);
}
