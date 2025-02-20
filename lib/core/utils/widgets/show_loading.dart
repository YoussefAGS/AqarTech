import 'package:flutter/material.dart';

import '../../style/colors/colors.dart';

bool isDialogOpen = false;

void showLoading(BuildContext context) {
  if(isDialogOpen) return;
  isDialogOpen = true; // Set the flag to true
  showDialog(
    context: context,
    barrierDismissible: false,
    // barrierColor: Colors.transparent,
    builder: (context) =>  Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainColor,
      ),
    ),
  ).then((_) {
    // When the dialog is dismissed, set the flag to false
    isDialogOpen = false;
  });
}

// Function to dismiss the dialog
void dismissLoading(BuildContext context) {
  if (isDialogOpen) {
    Navigator.of(context).pop();
    isDialogOpen = false; // Reset the flag
  }
}
