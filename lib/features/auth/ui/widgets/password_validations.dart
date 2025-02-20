
import 'package:flutter/material.dart';
import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/style/colors/colors.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';


class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least one lower case", hasLowerCase),
        verticalSpace(2),
        buildValidationRow("At least one upper case" ,hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            "At least one special character", hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow("At least one number" ,hasNumber),
        verticalSpace(2),
        buildValidationRow("At least 8 characters", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
         Icon(Icons.gpp_good_outlined, color: hasValidated ? ColorsManager.mainColor : ColorsManager.black ,size: 15,),
        horizontalSpace(10),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: hasValidated ? ColorsManager.mainColor : ColorsManager.black,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.mainColor : ColorsManager.black,
          ),
        )
      ],
    );
  }
}
