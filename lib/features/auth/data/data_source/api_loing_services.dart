

import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/sign_up_request_body.dart';
import 'login_data_source.dart';
part 'api_loing_services.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiAuthServices extends AuthDataSource {
  factory ApiAuthServices(Dio dio, {String baseUrl}) = _ApiAuthServices;

  @override
  @POST("/auth/login")
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @override
  @POST("/auth/register")
  Future<LoginResponse> signUp(
      @Body() SignUpRequestBody signUpRequestBody,
      );

}
