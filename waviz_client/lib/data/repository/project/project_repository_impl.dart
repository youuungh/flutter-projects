import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/data/data_sources/remote/project/project_api.dart';
import 'package:waviz_client/data/data_sources/remote/project/project_api_service.dart';
import 'package:waviz_client/data/mapper/project/project_mapper.dart';
import 'package:waviz_client/data/mapper/project/reward_mapper.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/entity/project/reward_entity.dart';
import 'package:waviz_client/domain/repository/project/project_repository.dart';

part 'project_repository_impl.g.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectApiClient projectApiService;

  ProjectRepositoryImpl(this.projectApiService);

  // 프로젝트 관련
  @override
  Future<ResponseModel> createProject(ProjectEntity projectEntity) async {
    final projectModel = ProjectMapper.toModel(projectEntity);
    return await projectApiService.createProject(projectModel);
  }

  @override
  Future<ResponseModel> updateProjectOpenState(String id, ProjectEntity projectEntity) async {
    final projectModel = ProjectMapper.toModel(projectEntity);
    return await projectApiService.updateProjectOpenState(id, projectModel);
  }

  @override
  Future<ResponseModel> deleteProject(String id) async {
    return await projectApiService.deleteProject(id);
  }

  // 프로젝트 조회
  @override
  Future<List<ProjectEntity>> getProjectByUserId(String userId) async {
    final result = await projectApiService.getProjectByUserId(userId);
    return ProjectMapper.toEntityList(result.data);
  }

  @override
  Future<List<ProjectEntity>> getProjectByProjectId(String id) async {
    final result = await projectApiService.getProjectByProjectId(id);
    return ProjectMapper.toEntityList(result.data);
  }

  // 리워드 관련
  @override
  Future<ResponseModel> createProjectReward(String projectId, RewardEntity rewardEntity) async {
    final rewardModel = RewardMapper.toModel(rewardEntity);
    return await projectApiService.createProjectReward(projectId, rewardModel);
  }
}

@riverpod
ProjectRepository projectRepository(Ref ref) {
  final service = ref.watch(projectApiServiceProvider);
  return ProjectRepositoryImpl(service);
}
