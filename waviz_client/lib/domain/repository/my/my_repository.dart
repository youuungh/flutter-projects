import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';

abstract class MyRepository {
  Future<List<ProjectEntity>> getProjectsByUserId(String userId);
  Future<ResponseModel> updateProjectOpenState(String id, ProjectEntity projectEntity);
  Future<ResponseModel> deleteProject(String id);
}
