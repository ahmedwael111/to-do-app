part of 'tasks_cubit_cubit.dart';

sealed class TasksCubitState {}

final class TasksCubitInitial extends TasksCubitState {}

class TasksCubitSuccess extends TasksCubitState {
  final List<TaskModel>? taskList;

  TasksCubitSuccess({this.taskList});
}
