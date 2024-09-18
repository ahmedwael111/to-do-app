import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/addCubit/add_cubit_cubit.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/coustom_textField.dart';
import 'package:to_do_app/widgets/coustom_textfield_dateTime.dart';
import 'package:to_do_app/widgets/coustom_textfield_timePicker.dart';
import 'package:to_do_app/widgets/show_snakeBar.dart';
import 'package:to_do_app/widgets/tasks_listView.dart';
import 'package:uuid/uuid.dart';

class FormColumn extends StatefulWidget {
  const FormColumn({
    super.key,
  });

  @override
  State<FormColumn> createState() => _FormColumnState();
}

class _FormColumnState extends State<FormColumn> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? task, selectedDate, selectedTime;
  var uuid = const Uuid();

  // Callback function to receive the selected time from the child widget
  void updateSelectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  // Callback function to receive the selected time from the child widget
  void updateSelectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
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
            
            maxlines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          CoustomTextfieldDatetime(
            readDate: updateSelectedDate,
          ),
          CoustomTextfieldTimepicker(
            onTime: updateSelectedTime,
          ),
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
                        var taskModel = TaskModel(
                            task: task!,
                            date: selectedDate,
                            time: selectedTime,
                            id: uuid.v4());
                        BlocProvider.of<AddCubit>(context).addCubit(taskModel);
                        showSnakBar(context, ' Task Added',
                            color: Colors.green);
                        shouldScrollToTop = true; // Add this flag in the file
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
