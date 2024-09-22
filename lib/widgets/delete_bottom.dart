import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/Cubits/tasks/tasks_cubit_cubit.dart';
import 'package:to_do_app/views/Edit_task_view.dart';
import 'package:to_do_app/widgets/show_deletConfirmation.dart';
import 'package:to_do_app/widgets/show_snakeBar.dart';

class DeletButton extends StatelessWidget {
  const DeletButton({
    super.key,
    required this.widget,
  });

  final EditTaskView widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDeleteConfirmation(context, () {
            widget.taskModel.delete();
            BlocProvider.of<TasksCubit>(context).fetchTaskes();
            Navigator.pop(context);
            showSnakBar(context, 'Task Deleted');
          });
        },
        icon: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.white,
        ));
  }
}
