import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/colors/colors.dart';

class CustomButton2 extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback onPressed;

  const CustomButton2({
    Key? key,
     this.color=null,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 75.sp,
        height: 20.sp, // Use appropriate size based on your requirement or screen size
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0.sp), // Adjust based on design
          color: color==null?Color(0xFFD1D1D2):ColorsManager.mainColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color:Colors.white, // Default text color, change if needed
            ),
          ),
        ),
      ),
    );
  }
}
