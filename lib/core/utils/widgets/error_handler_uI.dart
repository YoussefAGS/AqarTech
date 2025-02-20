import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RefreshErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String error;

  const RefreshErrorWidget({
    Key? key,
    required this.onPressed,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            color: Colors.white70,
            Icons.refresh,
            size: 25.0, // Adjusted size to fit without dependency on sp
          ),
        ),
        SizedBox(height: 5), // Replaced with SizedBox for spacing
        Center(
          child: Text(
            error,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.red), // Replace with your style
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
