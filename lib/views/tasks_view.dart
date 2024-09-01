import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/views/add_task.dart';
import 'package:to_do_app/widgets/app_bar.dart';
import 'package:to_do_app/widgets/tasks_listView.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddTaskView();
              },
            ),
          );
        },
        backgroundColor: kColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      appBar: appBarWidget(),
      body: const TasksListView(),
      // bottomNavigationBar: BottomNavigationBar(items: ),
    );
  }
}
