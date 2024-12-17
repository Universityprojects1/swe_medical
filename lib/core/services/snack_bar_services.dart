import 'package:flutter/material.dart';



import '../utils/app_color.dart';
import '../utils/app_style.dart';

class SnackBarServices {
  static void showErrorMessage(BuildContext context,String errorMessage) {
    var snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(),
      ),
      padding: const EdgeInsets.all(15),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.red,

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
