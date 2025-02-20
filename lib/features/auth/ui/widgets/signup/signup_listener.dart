
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/core/utils/widgets/show_loading.dart';
import 'package:aqartech/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
      current is SignUpLoading || current is SignUpSuccess || current is SignUpError,
      listener: (context, state) {
        state.whenOrNull(
          signUpLoading: () {
            showLoading(context);
          },
          signUpSuccess: (loginResponse) {
            dismissLoading(context);
            ShowToast.showToastSuccessTop(message: 'Account created successfully');
            context.pushNamedAndRemoveUntil(AppRoute.configurations);
          },
          signUpError: (error) {
            dismissLoading(context);
            ShowToast.showToastErrorTop(message: error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}