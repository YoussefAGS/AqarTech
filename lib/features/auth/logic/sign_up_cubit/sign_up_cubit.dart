import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/constants.dart';
import '../../../../core/common/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../data/models/login_response.dart';
import '../../data/models/sign_up_request_body.dart';
import '../../data/repos/login_repo.dart';
part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;
  SignUpCubit(this._authRepo) : super(const SignUpState.initial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailConfirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String countryCode="EG";

  final formKey = GlobalKey<FormState>();
  void emitSignUpStates() async {
    emit(const SignUpState.signUpLoading());
    // final response = await _authRepo.signUp(
    //   SignUpRequestBody(
    //     firstName: firstNameController.text,
    //     lastName: lastNameController.text,
    //     email: emailController.text,
    //     password: passwordController.text,
    //   ),
    // );
    if(isClosed) return;
    // response.when(success:
    //     (loginResponse) async{
    //   isLoggedInUser = true;
    //   await saveUserToken(loginResponse.token ?? '');
    //   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userId, loginResponse.data!.id.toString());
    //   emit(SignUpState.signUpSuccess(loginResponse));
    //   await saveLoginResponseData(loginResponse.data!);
    // },
    //     failure:
    //         (error) {
    //       emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? ''));
    //     });
  }
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
  // Future<void> saveLoginResponseData(LoginResponseData data) async {
  //   String jsonString = jsonEncode(data.toJson());
  //   await SharedPrefHelper.setData(SharedPrefKeys.userInfo, jsonString);
  // }
}
