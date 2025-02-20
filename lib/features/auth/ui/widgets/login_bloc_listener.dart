
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/utils/show_toast.dart';
import 'package:aqartech/core/utils/widgets/show_loading.dart';
import 'package:aqartech/features/auth/logic/cubit/login_cubit.dart';
import 'package:aqartech/features/auth/logic/cubit/login_state.dart';

import '../../../../core/routes/app_route.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showLoading(context);
          },
          success: (loginResponse) {
            dismissLoading(context);
            // ShowToast.showToastSuccessTop(message: loginResponse.message!);
            context.pushName(AppRoute.configurations);
          },
          error: (error) {
            dismissLoading(context);
            ShowToast.showToastErrorTop(message: error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
