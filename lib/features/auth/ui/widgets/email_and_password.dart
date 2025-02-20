import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aqartech/core/common/app_regex.dart';
import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/routes/app_route.dart';
import 'package:aqartech/core/style/colors/colors.dart';
import 'package:aqartech/core/utils/widgets/app_text_form_field.dart';
import 'package:aqartech/features/auth/logic/cubit/login_cubit.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/style/text_styles/text_styles.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            controller: context.read<LoginCubit>().phoneController,
            initialCountryCode: 'EG',
            // Default country
            onChanged: (phone) {
              context.read<LoginCubit>().countryCode = phone.countryCode;
            },
          ),
          verticalSpace(10),
          Text(
            "Password",
            style: TextStyles.font14Black500,
          ),
          verticalSpace(10),
          AppTextFormField(
            backgroundColor: Colors.transparent,
            // borderColor: ColorsManager.mainColor,
            controller: context.read<LoginCubit>().passwordController,
            // isObscureText: isObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                size: 15.sp,
                isObscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
            hintText: "Enter your password",
            hintStyle:
            TextStyles.font16Black500.copyWith(color: ColorsManager.gray),
          ),
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
