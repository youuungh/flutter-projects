import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/data/model/project/project_model.dart';
import 'package:waviz_client/data/model/project/reward_model.dart';

part 'project_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080/api/v1")
abstract class ProjectApiClient {
  factory ProjectApiClient(Dio dio, {String baseUrl}) = _ProjectApiClient;

  @POST("/project")
  Future<ResponseModel> createProject(@Body() ProjectItemModel body);

  @PUT("/project/{id}")
  Future<ResponseModel> updateProjectOpenState(
    @Path() String id,
    @Body() ProjectItemModel body,
  );

  @DELETE("/project/{id}")
  Future<ResponseModel> deleteProject(@Path() String id);

  @GET('/project/user/{userId}')
  Future<ProjectModel> getProjectByUserId(@Path() String userId);

  @POST("/project/reward/{id}")
  Future<ResponseModel> createProjectReward(
    @Path() String id,
    @Body() RewardItemModel body,
  );

  @GET("/project/{id}")
  Future<ProjectModel> getProjectByProjectId(@Path() String id);
}
