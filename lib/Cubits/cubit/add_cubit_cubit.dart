import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/models/task_model.dart';

part 'add_cubit_state.dart';

class AddCubit extends Cubit<AddCubitState> {
  AddCubit() : super(AddCubitInitial());
  addCubit(TaskModel note) async {
    try {
      var myBox = Hive.box<TaskModel>('taskbox');
      await myBox.add(note);
      emit(AddCubitSuccess());
    } catch (e) {
      emit(AddCubitFuilur(e.toString()));
    }
  }
}
