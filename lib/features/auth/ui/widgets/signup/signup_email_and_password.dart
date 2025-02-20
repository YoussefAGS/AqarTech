import 'package:aqartech/core/common/app_regex.dart';
import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
// import 'package:aqartech/core/language/lang_keys.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/app_text_form_field.dart';
import 'package:aqartech/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:aqartech/features/auth/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/colors/colors.dart';

class SignUpEmailAndPassword extends StatefulWidget {
  const SignUpEmailAndPassword({super.key});

  @override
  State<SignUpEmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<SignUpEmailAndPassword> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  TextEditingController passwordConfirmationController =
  TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FirstAndLastName(),
          verticalSpace(18),
          Text(
            context.translate(LangKeys.email),
            style: TextStyles.font14Black400,
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return context.translate(LangKeys.pleaseEnterAValidEmail);
              }
              return null;
            },
            hintText: context.translate(LangKeys.email),
            hintStyle: TextStyles.font16Black500.copyWith(color: ColorsManager.gray),
          ),
          // verticalSpace(18),
          // Text(
          //   context.translate(LangKeys.email),
          //   style: TextStyles.font14Black400,
          // ),
          // verticalSpace(10),
          // AppTextFormField(
          //   controller: context.read<SignUpCubit>().emailConfirmController,
          //   validator: (value) {
          //     if (value == null ||
          //         value.isEmpty ||
          //         !AppRegex.isEmailValid(value)||value!=context.read<SignUpCubit>().emailController.text) {
          //       return context.translate(LangKeys.pleaseEnterAValidEmail);
          //     }
          //     return null;
          //   },
          //   hintText: context.translate(LangKeys.email),
          // ),
          verticalSpace(18),
          Text(
            "phone",
            style: TextStyles.font14Black500,
          ),
          verticalSpace(10),
          IntlPhoneField(
            // cursorColor: ColorsManager.mainColor,
            textInputAction: TextInputAction.next,
            // or TextInputAction.done, etc.
            dropdownTextStyle: TextStyles.font15black500,
            style: TextStyles.font15black500,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.sp,
                vertical: 16.sp,
              ),
              labelText: "Phone Number",
              labelStyle:
              TextStyles.font16Black500.copyWith(color: ColorsManager.gray),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.mainColor,
                  width: 1.3.sp,
                ),
                borderRadius: BorderRadius.circular(10.0.sp),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.gray,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.0.sp),
              ),
            ),
            controller: context.read<SignUpCubit>().phoneController,
            initialCountryCode: 'EG',
            // Default country
            onChanged: (phone) {
              context.read<SignUpCubit>().countryCode = phone.countryCode;
            },
          ),
          verticalSpace(8),
          Text(
            context.translate(LangKeys.password),
            style: TextStyles.font14Black400,
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: context
                .read<SignUpCubit>()
                .passwordController,
            hintText:   context.translate(LangKeys.enterPassword),
            // isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                size: 15.sp,
                isPasswordObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return context.translate(LangKeys.pleaseEnterAValidPassword);
              }
            },
            hintStyle: TextStyles.font16Black500.copyWith(color: ColorsManager.gray),

          ),
          verticalSpace(18),
          Text(
            context.translate(LangKeys.confirmpassword),
            style: TextStyles.font14Black400,
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: context
                .read<SignUpCubit>()
                .passwordConfirmController,
            hintText: context.translate(LangKeys.enterconfirmpassword),
            // isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                  !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                size: 15.sp,
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              print(value);
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)||value!=passwordController.text) {
                return context.translate(LangKeys.pleaseEnterAValidPassword);
              }
            },
            hintStyle: TextStyles.font16Black500.copyWith(color: ColorsManager.gray),

          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

class FirstAndLastName extends StatelessWidget {
  const FirstAndLastName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate(LangKeys.firstname),
                style: TextStyles.font14Black500,
              ),
              verticalSpace(10),
              AppTextFormField(
                hintText:  context.translate(LangKeys.firstname),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.translate(LangKeys.pleaseEnterYourFirstName);
                  }
                },
                hintStyle: TextStyles.font16Black500.copyWith(color: ColorsManager.gray),

                controller: context
                    .read<SignUpCubit>()
                    .firstNameController,
              ),
            ],
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate(LangKeys.lastname),
                style: TextStyles.font14Black500,
              ),
              verticalSpace(10),
              AppTextFormField(
                hintText:                 context.translate(LangKeys.lastname),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.translate(LangKeys.pleaseEnterYourLastName);
                  }
                },
                hintStyle: TextStyles.font16Black500.copyWith(color: ColorsManager.gray),

                controller: context
                    .read<SignUpCubit>()
                    .lastNameController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
