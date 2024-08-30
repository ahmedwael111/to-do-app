import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: Checkbox(
                    value: isChecked,
                    activeColor: kColor,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                ),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
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
