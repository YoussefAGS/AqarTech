import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CircularImageWidget.dart';

class LogoRowWidget extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final String text;
  final TextStyle textStyle;

  const LogoRowWidget({
    Key? key,
    required this.imagePath,
    required this.imageHeight,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularImageWidget(
          height: imageHeight,
          imagePath: imagePath,
        ),
         SizedBox(width: 10.sp), // Replaces horizontalSpace(10)
        Expanded(
          child: Text(
            text,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
