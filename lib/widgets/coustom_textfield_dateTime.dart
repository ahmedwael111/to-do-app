import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/widgets/form_column.dart';

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
        String dateTime = DateFormat('dd-MM-yyyy').format(picked);
        dateController.text = dateTime;
        navigateToNextScreen(dateTime);
      });
    }
  }

  void clearDateTime() {
    setState(() {
      dateController.clear();
    });
  }

  void navigateToNextScreen(String selectedTime) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormColumn(selectedDateTime: selectedTime),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      decoration: InputDecoration(
        focusedBorder: ounderlinteinputBorde(),
        labelText: "Select Date",
        labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 32,
            ),
            if (dateController.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: clearDateTime,
              ),
          ],
        ),
      ),
      readOnly: true, // Prevents the keyboard from appearing
      onTap: () => _selectDate(context),
    );
  }
}

UnderlineInputBorder ounderlinteinputBorde() {
  return const UnderlineInputBorder(
      borderSide: BorderSide(color: kColor),
      borderRadius: BorderRadius.horizontal());
}
