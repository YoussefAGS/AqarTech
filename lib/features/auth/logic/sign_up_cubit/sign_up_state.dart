part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = Initial;
  const factory SignUpState.signUpLoading() = SignUpLoading;
  const factory SignUpState.signUpSuccess(LoginResponse data) = SignUpSuccess;

  const factory SignUpState.signUpError({required String error}) = SignUpError;
}
