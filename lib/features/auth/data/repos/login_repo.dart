


import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/login_data_source.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/sign_up_request_body.dart';

class AuthRepo {
  final AuthDataSource _apiService;

  AuthRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LoginResponse>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
