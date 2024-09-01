import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constants.dart';

class CoustomTextfieldDatetime extends StatefulWidget {
  const CoustomTextfieldDatetime({super.key});

  @override
  State<CoustomTextfieldDatetime> createState() =>
      _CoustomTextfieldDatetimeState();
}

class _CoustomTextfieldDatetimeState extends State<CoustomTextfieldDatetime> {
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      decoration: const InputDecoration(
        labelText: "Select Date",
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true, // Prevents the keyboard from appearing
      onTap: () => _selectDate(context),
    );
  }
}
