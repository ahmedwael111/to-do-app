import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

Future<void> showDeleteConfirmation(
    BuildContext context, Function onConfirm) async {
  return showDialog(
    context: context,
    barrierDismissible:
        false, // Prevents dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // Rounded corners
        ),
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onConfirm(); // Call the onConfirm function passed in
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Delete', style: TextStyle(color: kColor)),
          ),
        ],
      );
    },
  );
}
