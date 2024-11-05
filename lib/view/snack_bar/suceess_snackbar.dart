import 'package:flutter/material.dart';

void showSuccessSnackbar(BuildContext context, String title, String description) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(description),
        Icon(Icons.check, color: Colors.white),
      ],
    ),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 2), // Adjust as needed
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
