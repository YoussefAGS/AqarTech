import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  const ShowToast._();

  static bool isToastActive = false; // Flag to check if a toast is active

  static void showToastErrorTop({
    required String message,
    double? seconds,
  }) {
    _showCustomToast(
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      durationInSeconds: seconds ?? 1,
    );
  }

  static void showToastWarningTop({
    required String message,
    double? seconds,
  }) {
    _showCustomToast(
      message: message,
      backgroundColor: Colors.orange.shade800,
      textColor: Colors.white,
      durationInSeconds: seconds ?? 1,
    );
  }

  static void showToastSuccessTop({
    required String message,
    double? seconds,
  }) {
    _showCustomToast(
      message: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      durationInSeconds: seconds ?? 1,
    );
  }

  static void _showCustomToast({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required double durationInSeconds,
  }) {
    if (isToastActive) return; // Prevent new toast if one is active

    isToastActive = true; // Set flag to true when toast starts
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16,
    );

    // Use a Timer to reset the toast flag after the specified duration
    Timer(Duration(milliseconds: (durationInSeconds * 2000).toInt()), () {
      Fluttertoast.cancel(); // Dismiss the toast
      isToastActive = false; // Reset the flag
    });
  }
  /// Cancels any active toast, if one is being displayed.
  static void cancelActiveToast() {
    if (isToastActive) {
      Fluttertoast.cancel();
      isToastActive = false;
    }
  }
}
