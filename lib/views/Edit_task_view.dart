import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';
import 'package:to_do_app/widgets/coustom_textfield_dateTime.dart';
import 'package:to_do_app/widgets/coustom_textfield_timePicker.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
              ))
        ],
        backgroundColor: const Color(0xff151515),
        title: const Text('Edit Task',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CostomTextFormField(
              labal: 'Edit Task',
              hint: 'Add Task',
              maxlines: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CoustomTextfieldDatetime(),
            CoustomTextfieldTimepicker()
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
}
