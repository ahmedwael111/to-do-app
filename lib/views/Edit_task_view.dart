import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';
import 'package:to_do_app/widgets/coustom_textfield_dateTime.dart';
import 'package:to_do_app/widgets/coustom_textfield_timePicker.dart';
import 'package:to_do_app/widgets/delete_bottom.dart';
import 'package:to_do_app/widgets/edit_floatingAction.dart';


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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        actions: [DeletButton(widget: widget)],
        backgroundColor: Colors.black12,
        title: const Row(
          children: [
            SizedBox(
              width: 20,
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
        padding: const EdgeInsets.symmetric(horizontal: 18),
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
              maxlines: 4,
              taskModel: widget.taskModel,
              isEditing: true,
            ),
            const SizedBox(
              height: 22,
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
      floatingActionButton: EditFloatingActionBottom(widget: widget, selectedDate: selectedDate, selectedTime: selectedTime),
    );
  }
}


