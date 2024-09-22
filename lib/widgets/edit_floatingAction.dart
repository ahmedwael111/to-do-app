import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/tasks/tasks_cubit_cubit.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/views/Edit_task_view.dart';
import 'package:to_do_app/widgets/show_snakeBar.dart';
import 'package:to_do_app/widgets/tasks_listView.dart';

class EditFloatingActionBottom extends StatelessWidget {
  const EditFloatingActionBottom({
    super.key,
    required this.widget,
    required this.selectedDate,
    required this.selectedTime,
  });

  final EditTaskView widget;
  final String? selectedDate;
  final String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: kColor,
        child: const Icon(
          Icons.check,
          size: 33,
        ),
        onPressed: () {
          shouldScrollToTop = false; // Add this flag in the file
    
          widget.taskModel.date = selectedDate ?? widget.taskModel.date;
          widget.taskModel.time = selectedTime ?? widget.taskModel.time;
          widget.taskModel.save();
          BlocProvider.of<TasksCubit>(context).fetchTaskes();
          showSnakBar(context, 'Edit Task Successfly', color: Colors.green);
          Navigator.pop(context);
        });
  }
}