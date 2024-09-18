import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

Widget? ifElseOfDateAndTime(TaskModel taskModel) {
  if (taskModel.date == null && taskModel.time == null) {
    return null;
  } else if (taskModel.date == null && taskModel.time != null) {
    return Text(
      '${taskModel.time}',
      style: TextStyle(color: Colors.blue.withOpacity(0.7), fontSize: 16),
    );
  } else if (taskModel.date != null && taskModel.time == null) {
    return Text(
      '${taskModel.date}',
      style: TextStyle(color: Colors.blue.withOpacity(0.7), fontSize: 16),
    );
  } else if (taskModel.date != null && taskModel.time != null) {
    return Text(
      '${taskModel.date}, ${taskModel.time}',
      style: TextStyle(color: Colors.blue.withOpacity(0.7), fontSize: 16),
    );
  }
  return null;
}