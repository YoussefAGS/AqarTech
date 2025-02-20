

import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/sign_up_request_body.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequestBody loginRequestBody);
  Future<LoginResponse> signUp(SignUpRequestBody signUpRequestBody);
}