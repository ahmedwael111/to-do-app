import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';

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
        backgroundColor: kColor,
        title: const Text('Edit Task',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CostomTextFormField(
              hint: 'Add Task',
              maxlines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                SizedBox(
                  width: 280,
                  child: TextField(
                    cursorColor: kColor,
                    decoration: InputDecoration(
                        border: ounderlinteinputBorde(),
                        focusedBorder: ounderlinteinputBorde()),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // DatePickerDialog(
                      //   firstDate: DateTime.now(),
                      //   lastDate: DateTime.now(),
                      // );
                    },
                    icon: const Icon(
                      Icons.date_range_sharp,
                      size: 33,
                    )),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                SizedBox(
                  width: 319,
                  child: TextField(
                    cursorColor: kColor,
                    decoration: InputDecoration(
                      border: ounderlinteinputBorde(),
                        focusedBorder: ounderlinteinputBorde()),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // DatePickerDialog(
                      //   firstDate: DateTime.now(),
                      //   lastDate: DateTime.now(),
                      // );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.clock,
                      size: 30,
                    )),
              ],
            )
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


