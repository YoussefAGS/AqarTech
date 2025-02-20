import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType { success, warning, error }

void showTopSnackBar(BuildContext context, String message, SnackBarType type) {
  final overlay = Overlay.of(context);

  // Get the color based on the type
  final color = _getSnackBarColor(type);

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: 20.sp, right: 16.sp, left: 16.sp),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  // Insert the OverlayEntry into the Overlay
  overlay.insert(overlayEntry);

  // Remove it after a delay
  Future.delayed(const Duration(seconds: 1), () {
    overlayEntry.remove();
  });
}

// Helper function to get color based on SnackBarType
Color _getSnackBarColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return Colors.green;
    case SnackBarType.warning:
      return Colors.orange;
    case SnackBarType.error:
      return Colors.red;
    default:
      return Colors.black; // Default fallback color
  }
}
