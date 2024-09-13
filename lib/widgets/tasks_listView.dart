import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/tasks/tasks_cubit_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/task_item.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({
    super.key,
  });

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchTaskes();
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  void scrollToTop() {
    if (_scrollController.hasClients)
      _scrollController.jumpTo(
        0, // Scroll to the top (position 0)
        // duration: const Duration(milliseconds: 300), // Animation duration
        // curve: Curves.easeInOut, // Animation curve
      );
  } 

  bool? isChecked = false;
  List<Map<String, dynamic>> items = [
    {'text': 'Item 1', 'checked': false},
    {'text': 'Item 2', 'checked': false},
    {'text': 'Item 3', 'checked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksCubitState>(
      builder: (context, state) {
        List<TaskModel> listOfTasks =
            BlocProvider.of<TasksCubit>(context).taskList ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              // physics: const BouncingScrollPhysics(),
              itemCount: listOfTasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TaskItem(
                    valueKey: ValueKey(items[index]['text']), // Unique key for each item,
                    taskModel: listOfTasks[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
