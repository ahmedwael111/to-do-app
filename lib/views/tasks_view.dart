import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/widgets/app_bar.dart';
import 'package:to_do_app/widgets/task_item.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kColor,
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
        appBar: appBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TaskItem(),
                );
              }),
        ));
  }
}
