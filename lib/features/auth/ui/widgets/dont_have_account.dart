

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aqartech/core/style/colors/colors.dart';


import '../../../../core/style/text_styles/text_styles.dart';

class SignUpPrompt extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final VoidCallback? onTap;
  const SignUpPrompt({
    super.key,
    this.firstText,
    this.secondText,
    this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text:  firstText,
          style:  TextStyles.font18WhiteMedium.copyWith(color: ColorsManager.gray),
          children: [
            TextSpan(
              text:  secondText,
              style:  TextStyles.font18WhiteMedium.copyWith(
                color: ColorsManager.black,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
