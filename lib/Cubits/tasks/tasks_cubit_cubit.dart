import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/models/task_model.dart';

part 'tasks_cubit_state.dart';

class TasksCubit extends Cubit<TasksCubitState> {
  List<TaskModel>? taskList;
  TasksCubit() : super(TasksCubitInitial());
  fetchTaskes() async {
    var myBox = Hive.box<TaskModel>('taskbox');
    taskList = myBox.values.toList();
    taskList = taskList?.reversed.toList();
    emit(TasksCubitSuccess());
  }
}
