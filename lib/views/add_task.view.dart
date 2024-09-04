import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/cubit/add_cubit_cubit.dart';
import 'package:to_do_app/widgets/form_column.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff151515),
        title: const Text('New Task',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocListener<AddCubit, AddCubitState>(
          listener: (context, state) {
            if (state is AddCubitSuccess) {
              Navigator.pop(context);
            }
          },
          child: const FormColumn(),
        ),
      ),
    );
  }
}
