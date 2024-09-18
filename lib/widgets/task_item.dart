import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/tasks/tasks_cubit_cubit.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/Edit_task_view.dart';
import 'package:to_do_app/widgets/show_snakeBar.dart';
import 'package:to_do_app/widgets/tasks_listView.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditTaskView(
            taskModel: widget.taskModel,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
            padding: const EdgeInsets.only(right: 18, left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: isChecked,
                      activeColor: kColor,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                          if (isChecked) {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              widget.taskModel.delete();
                              showSnakBar(
                                context,
                                'Task Done ✅', /*color: Colors.green*/
                              );
                              BlocProvider.of<TasksCubit>(context)
                                  .fetchTaskes();
                              setState(() {});
                            });
                            shouldScrollToTop =
                                false; // Add this flag in the file
                          }
                        });
                      },
                    ),
                  ),
                  title: Text(
                    widget.taskModel.task.trim(),
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  subtitle: widget.taskModel.date == null &&
                          widget.taskModel.time == null
                      ? null
                      : Text(
                          '${widget.taskModel.date}, ${widget.taskModel.time}',
                          style: TextStyle(
                              color: Colors.blue.withOpacity(0.7),
                              fontSize: 16),
                        ),
                ),
              ],
            )),
      ),
    );
  }
}
