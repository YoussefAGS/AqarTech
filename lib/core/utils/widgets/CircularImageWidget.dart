import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularImageWidget extends StatelessWidget {
  final double height;
  final String imagePath;
  final bool isNetworkImage; // Determines if the image is from a network source
  final Color? borderColor;

  const CircularImageWidget({
    Key? key,
    required this.height,
    required this.imagePath,
    this.isNetworkImage = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.sp,
      width: height.sp,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width:borderColor!=null ? 0.5.sp:0.sp,
        ),
        image: DecorationImage(
          image: isNetworkImage
              ? NetworkImage(imagePath) // Use NetworkImage for network sources
              : AssetImage(imagePath) as ImageProvider, // Use AssetImage for local assets
          fit: BoxFit.fill,
        ),
      ),
      child: const SizedBox.shrink(),
    );
  }
}
