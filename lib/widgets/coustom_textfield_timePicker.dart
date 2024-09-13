import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class CoustomTextfieldTimepicker extends StatefulWidget {
  final Function(String)? onTime;
  final String? label;
  const CoustomTextfieldTimepicker(
      {super.key, this.onTime, this.label = "Add Time"});

  @override
  State<CoustomTextfieldTimepicker> createState() =>
      _CoustomTextfieldTimepickerState();
}

class _CoustomTextfieldTimepickerState
    extends State<CoustomTextfieldTimepicker> {
  final TextEditingController timeControler = TextEditingController();
  Future<void> pickerTime(context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        String time = picked.format(context);
        timeControler.text = time;
        widget.onTime!(time);
      });
    }
  }

  void _clearTime() {
    setState(() {
      timeControler.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: timeControler,
      decoration: InputDecoration(
        focusedBorder: ounderlinteinputBorde(),
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.blue, fontSize: 16),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.access_time,
              color: Colors.white,
              size: 32,
            ),
            if (timeControler.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _clearTime,
              ),
          ],
        ),
      ),
      readOnly: true,
      onTap: () => pickerTime(context),
    );
  }
}

UnderlineInputBorder ounderlinteinputBorde() {
  return const UnderlineInputBorder(
      borderSide: BorderSide(color: k2Color),
      borderRadius: BorderRadius.horizontal());
}
