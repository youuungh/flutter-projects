import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';
import 'package:waviz_client/domain/entity/project/reward_entity.dart';

abstract class ProjectRepository {
  // 프로젝트 관련
  Future<ResponseModel> createProject(ProjectEntity projectEntity);
  Future<ResponseModel> updateProjectOpenState(String id, ProjectEntity projectEntity);
  Future<ResponseModel> deleteProject(String id);
  
  // 프로젝트 조회
  Future<List<ProjectEntity>> getProjectByUserId(String userId);
  Future<List<ProjectEntity>> getProjectByProjectId(String id);
  
  // 리워드 관련
  Future<ResponseModel> createProjectReward(String projectId, RewardEntity rewardEntity);
}
