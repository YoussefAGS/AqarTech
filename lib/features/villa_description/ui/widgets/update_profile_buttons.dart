import 'package:aqartech/core/style/colors/colors.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/custom_snake_bar.dart';
import '../../../../core/common/spacing.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class CallAndVisiteButtons extends StatelessWidget {
  const CallAndVisiteButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: GestureDetector(
          onTap: () {

          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "call",
                  style: TextStyles.font17blackMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      horizontalSpace(10),
      Expanded(
          child: CustomButton(
              text: "Schedule a visit",
              onPressed: () {

              },textStyle: TextStyles.font14white500,)),
    ]);
  }
}
