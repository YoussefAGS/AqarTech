import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animations/animate_do.dart';
import '../../../../core/common/spacing.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/style/colors/colors.dart';
import '../../../../core/style/text_styles/text_styles.dart';
import '../../../../core/utils/widgets/custom_Sliver_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../logic/cubit/login_cubit.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/login_bloc_listener.dart';

class LoginBodyWithSliverAppBar extends StatelessWidget {
  const LoginBodyWithSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(justSpace: true,),
        SliverPadding(
          padding: EdgeInsets.only(
              left: 15.sp,
              right: 15.sp,bottom: 10.sp),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Text("Sign in",style: TextStyles.font32Medium,),
                verticalSpace(30),
                CustomFadeInRight(duration: 400, child: EmailAndPassword()),

              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomFadeInRight(
                    duration: 400,
                    child: CustomButton(text: "Login", onPressed: () {
                      context.pushNamedAndRemoveUntil(AppRoute.mainScreen,arguments: 0);
                      // context.read<LoginCubit>().emitLoginStates();
                    })),
                verticalSpace(10),
                TextButton(
                  child: Text(
                    "Forgot Password?",
                    style:
                        TextStyles.font18whiteSemiBold.copyWith(color: ColorsManager.mainColor),
                  ),
                  onPressed: () {
                    context.pushName(AppRoute.forgotPassword);
                  },
                ),
                verticalSpace(50),
                CustomFadeInRight(
                    duration: 400,
                    child: SignUpPrompt(
                      firstText: "Don’t have an account?",
                      secondText: "Sign up",
                      onTap: () {
                        context.pushName(AppRoute.signupScreen);
                      },
                    )
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}