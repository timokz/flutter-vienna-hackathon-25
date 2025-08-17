import 'package:flutter/material.dart';

class ErrorSnackbar {
  void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.onError),
        maxLines: 3,
      ),
      showCloseIcon: true,
      duration: Duration(seconds: 30),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }
}
