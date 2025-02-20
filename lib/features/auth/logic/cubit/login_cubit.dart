import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/constants.dart';
import '../../../../core/common/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../data/models/login_request_body.dart';
import '../../data/models/login_response.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginState.initial());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String countryCode="Eg";
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    // String? token = await _firebaseMessaging.getToken();
    // print("Firebase Messaging Token: $token");

    if(!formKey.currentState!.validate()) {
      return;
    }

    emit(const LoginState.loading());
    final response = await _authRepo.login(
      LoginRequestBody(
        email: phoneController.text,
        password: passwordController.text,
      ),
    );
    if(isClosed) return;
    response.when(success:
        (loginResponse)
    async {
      await saveUserToken(loginResponse.token ?? '');
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.userId, loginResponse.userResponse!.userId.toString());
      await saveLoginResponseData(loginResponse.userResponse!);
      isLoggedInUser=true;
      emit(LoginState.success(loginResponse));

    },
        failure:
            (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
  Future<void> saveUserToken(String token) async {
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
      DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
  Future<void> saveLoginResponseData(LoginResponseUserResponse data) async {
    String jsonString = jsonEncode(data.toJson());
    await SharedPrefHelper.setData(SharedPrefKeys.userInfo, jsonString);
  }
}
