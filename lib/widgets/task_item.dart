import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.check_box_rounded,
                  size: 28,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'the first message ',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                '30/8/2024 , 11:00',
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
