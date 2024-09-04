

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/Cubits/addCubit/add_cubit_cubit.dart';
import 'package:to_do_app/simple_bloc_observer.dart';
import 'package:to_do_app/views/tasks_view.dart';

import 'models/task_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('taskbox');
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [ 
        BlocProvider(create: (context) => AddCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const TasksView(),
      ),
    );
  }
}
