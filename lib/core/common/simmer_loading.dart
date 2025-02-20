import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool isCircle ;

  ShimmerLoading({required this.width, required this.height, this.borderRadius = 8.0, this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white70,
      highlightColor: Colors.white24,
      child: Container(
        width: width,
        height: height,
        decoration: isCircle ?BoxDecoration(
            color: Colors.white10,
            shape: BoxShape.circle
        ):BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
