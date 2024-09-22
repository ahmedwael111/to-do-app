import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/addCubit/add_cubit_cubit.dart';
import 'package:to_do_app/Cubits/tasks/tasks_cubit_cubit.dart';
import 'package:to_do_app/widgets/form_column.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.add_circle_outline_rounded,
                size: 30,
              ),
              SizedBox(
                width: 6,
              ),
              Text('New Task',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocListener<AddCubit, AddCubitState>(
            listener: (context, state) {
              if (state is AddCubitSuccess) {
                BlocProvider.of<TasksCubit>(context).fetchTaskes();
                Navigator.pop(context);
              }
            },
            child: const FormColumn(),
          ),
        ),
      ),
    );
  }
}
