import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CircularImageWidget.dart';

class PersonAndPositionWidget extends StatelessWidget {
  final String name;
  final String position;
  final String imagePath;
  final double imageHeight;
  final TextStyle nameTextStyle;
  final TextStyle positionTextStyle;

  const PersonAndPositionWidget({
    super.key,
    required this.name,
    required this.position,
    required this.imagePath,
    this.imageHeight = 50.0, // Default image height
    required this.nameTextStyle ,// Default style for name
    required this.positionTextStyle  // Default style for position
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularImageWidget(
          height: imageHeight,
          imagePath: imagePath,
        ),
         SizedBox(width: 10.0.sp), // For horizontal spacing
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: nameTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                position,
                style: positionTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


