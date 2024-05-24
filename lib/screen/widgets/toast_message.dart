import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

class ToastMessage {
  static void show(BuildContext context, String message) {
    DelightToastBar(
      autoDismiss: true,
      builder: (context) => ToastCard(
        leading: const Icon(Icons.ac_unit_rounded),
        title: Text(message),
      ),
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(seconds: 3),
    ).show(context);
  }
}
