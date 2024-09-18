import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/Cubits/tasks/tasks_cubit_cubit.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';
import 'package:to_do_app/widgets/coustom_textfield_dateTime.dart';
import 'package:to_do_app/widgets/coustom_textfield_timePicker.dart';
import 'package:to_do_app/widgets/show_deletConfirmation.dart';
import 'package:to_do_app/widgets/show_snakeBar.dart';
import 'package:to_do_app/widgets/tasks_listView.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  String? task, selectedDate, selectedTime;

  void updateSelectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void updateSelectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDeleteConfirmation(context, () {
                  widget.taskModel.delete();
                  BlocProvider.of<TasksCubit>(context).fetchTaskes();
                  Navigator.pop(context);
                });
              },
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
              ))
        ],
        backgroundColor: const Color(0xff151515),
        title: const Row(
          children: [
            SizedBox(
              width: 45,
            ),
            Icon(
              Icons.edit_note_rounded,
              size: 38,
            ),
            SizedBox(
              width: 6,
            ),
            Text('Edit Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CostomTextFormField(
              onChanged: (p0) {
                task = p0;
                widget.taskModel.task = task ?? widget.taskModel.task;
              },
              hint: widget.taskModel.task,
              maxlines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            CoustomTextfieldDatetime(
              readDate: updateSelectedDate,
              label: widget.taskModel.date ?? 'Add Date',
            ),
            CoustomTextfieldTimepicker(
              onTime: updateSelectedTime,
              label: widget.taskModel.time ?? 'Add Time',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
          }),
    );
  }
}
