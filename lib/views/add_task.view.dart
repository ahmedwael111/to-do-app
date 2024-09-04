import 'package:flutter/material.dart';
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: FormColumn(),
      ),
    );
  }
}
