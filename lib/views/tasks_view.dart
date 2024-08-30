import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 42,
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              'Tasks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
