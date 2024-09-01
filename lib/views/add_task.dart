import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';
import 'package:to_do_app/widgets/coustom_textfield_dateTime.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: const Text('New Task',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CostomTextFormField(
              hint: 'Add Task',
              maxlines: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CoustomTextfieldDatetime()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kColor,
          child: const Icon(
            Icons.check,
            size: 33,
          ),
          onPressed: () {}),
    );
  }

  UnderlineInputBorder ounderlinteinputBorde() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(color: kColor),
        borderRadius: BorderRadius.horizontal());
  }
}
