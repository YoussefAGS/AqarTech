import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/colors/colors.dart';

class CustomLinearButton extends StatelessWidget {
  const CustomLinearButton({
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
    super.key,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(

        height: height ?? 44.sp,
        width: width ?? 44.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: ColorsManager.mainColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}
