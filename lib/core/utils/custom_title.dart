import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 29.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Or ColorsManager.white if defined
            ),
          ),
          if(subtitle.isNotEmpty) SizedBox(height: 10.sp), // Equivalent to `verticalSpace(10)`
          if(subtitle.isNotEmpty) Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xffD0C4DE),
            ),
          ),
          SizedBox(height: 10.sp), // Equivalent to `verticalSpace(20)`
        ],
      ),
    );
  }
}
