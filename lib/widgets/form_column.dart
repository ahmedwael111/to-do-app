import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';
import 'package:to_do_app/widgets/coustom_textfield_dateTime.dart';
import 'package:to_do_app/widgets/coustom_textfield_timePicker.dart';

class FormColumn extends StatefulWidget {
  const FormColumn({
    super.key,
    this.selectedDateTime,
    this.selectedTime,
  });
  final String? selectedDateTime;
  final String? selectedTime;
  @override
  State<FormColumn> createState() => _FormColumnState();
}

class _FormColumnState extends State<FormColumn> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String? task, date, time;

  @override
  void initState() {
    date = widget.selectedDateTime;
    time = widget.selectedTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CostomTextFormField(
            onSaved: (p0) {
              task = p0;
            },
            labal: 'Add New Task',
            hint: 'Add Task',
            maxlines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const CoustomTextfieldDatetime(),
          const CoustomTextfieldTimepicker(),
          Expanded(
            child: Stack(children: [
              Positioned(
                bottom: 14,
                right: 2,
                child: FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: kColor,
                    child: const Icon(
                      Icons.check,
                      size: 33,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
