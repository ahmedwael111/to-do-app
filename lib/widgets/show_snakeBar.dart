import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String message,
    {Color color = const Color.fromARGB(255, 95, 93, 93)}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    // behavior: SnackBarBehavior.floating, // Makes the SnackBar float
    padding: EdgeInsets.zero,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
    backgroundColor: color,
  ));
}
