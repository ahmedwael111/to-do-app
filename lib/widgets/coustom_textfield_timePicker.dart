import 'package:flutter/material.dart';

class CoustomTextfieldTimepicker extends StatefulWidget {
  const CoustomTextfieldTimepicker({super.key});

  @override
  State<CoustomTextfieldTimepicker> createState() =>
      _CoustomTextfieldTimepickerState();
}

class _CoustomTextfieldTimepickerState
    extends State<CoustomTextfieldTimepicker> {
  final TextEditingController timeControler = TextEditingController();
  Future<void> pickerTime(constxt) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        timeControler.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: timeControler,
      decoration: const InputDecoration(
          labelText: 'add time', suffixIcon: Icon(Icons.access_time)),
      readOnly: true,
      onTap: () => pickerTime(context),
    );
  }
}
