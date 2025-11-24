import 'package:flutter/material.dart';

class AppDialog {
  static void showMessage(
    String title,
    BuildContext context, {
    DialogType type = DialogType.success,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text(title),
        backgroundColor: type == DialogType.success
            ? Colors.green
            : Colors.redAccent,

        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

enum DialogType { success, error }
