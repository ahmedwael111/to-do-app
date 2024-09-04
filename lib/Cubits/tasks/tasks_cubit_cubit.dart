import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/task_model.dart';

part 'tasks_cubit_state.dart';

class TasksCubitCubit extends Cubit<TasksCubitState> {
  List<TaskModel>? taskList;
  TasksCubitCubit() : super(TasksCubitInitial());
  fetchTaskes() async {
    var myBox = Hive.box<TaskModel>('taskbox');
    taskList = myBox.values.toList();
    emit(TasksCubitSuccess());
  }
}
