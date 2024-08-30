import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/app_bar.dart';
import 'package:to_do_app/widgets/task_item.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      appBar: appBarWidget(),
      body: ListView(
        children: const [TaskItem()],
      ),
    );
  }
}
