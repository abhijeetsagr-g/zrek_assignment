import 'package:flutter/material.dart';

void showUnimplementedSnackbar(BuildContext context, String feature) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$feature is not available yet'),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color(0xFF1C1C1C),
    ),
  );
}
