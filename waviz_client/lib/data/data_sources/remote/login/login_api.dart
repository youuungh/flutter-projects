import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waviz_client/core/model/response_model.dart';
import 'package:waviz_client/data/model/login/login_model.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/api/v1')
abstract class LoginApiClient {
  factory LoginApiClient(Dio dio, {String baseUrl}) = _LoginApiClient;

  @POST("/signup")
  Future<ResponseModel> signUp(@Body() LoginModel body);

  @POST("/signin")
  Future<HttpResponse<dynamic>> signIn(@Body() LoginModel body);

  @GET("/checkauth")
  Future<ResponseModel> checkEmail(@Body() LoginModel body);
}
