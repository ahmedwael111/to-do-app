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

  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Method to scroll to the top
  void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksCubitState>(
      builder: (context, state) {
        List<TaskModel> listOfTasks =
            BlocProvider.of<TasksCubit>(context).taskList ?? [];
        // Scroll to the top whenever the list changes (add/delete)
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToTop();
        });
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              controller: scrollController,
              // reverse: true,
              // physics: const BouncingScrollPhysics(),
              itemCount: listOfTasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TaskItem(
                    // scrollController: scrollController,
                    key: ValueKey(
                        listOfTasks[index].id), // Unique key for each item,
                    taskModel: listOfTasks[index],
                    toDelete: () {
                      // BlocProvider.of<TasksCubit>(context)
                      //     .insertTaskAtTop(listOfTasks[index]);
                      // scrollToTop();
                    },
                  ),
                );
              }),
        );
      },
    );
  }
}
