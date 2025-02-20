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
import '../../logic/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/signup/signup_email_and_password.dart';
import '../widgets/signup/signup_listener.dart';
import 'login_body.dart';


class SignupBodyWithSliverAppBar extends StatelessWidget {
  const SignupBodyWithSliverAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverPadding(
          padding: EdgeInsets.only(
              left: 15.sp,
              right: 15.sp,bottom: 10.sp),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Text("Sign up",style: TextStyles.font32Medium,),
                verticalSpace(30),
                CustomFadeInRight(duration: 400, child: SignUpEmailAndPassword()),
                // const TermsAndConditions()
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
                    child: CustomButton(text: "Sign Up", onPressed: () {
                      context.pushNamedAndRemoveUntil(AppRoute.mainScreen,arguments: 0);
                    })),
                verticalSpace(50),
                CustomFadeInRight(
                  duration: 400,
                  child: Center(
                    child: SignUpPrompt(
                      firstText: "Already have an account?",
                      secondText: "login",
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ),
                ),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}



