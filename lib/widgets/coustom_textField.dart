import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/task_model.dart';

class CostomTextFormField extends StatefulWidget {
  const CostomTextFormField({
    super.key,
    
    this.maxlines = 1,
    this.onSaved,
    this.onChanged,
    this.labal,
    this.taskModel,
  });
 
  final int maxlines;
  final String? labal;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TaskModel? taskModel;

  @override
  State<CostomTextFormField> createState() => _CostomTextFormFieldState();
}

class _CostomTextFormFieldState extends State<CostomTextFormField> {
  late TextEditingController controller;

  @override
  void initState() {
    if (widget.taskModel != null) {
      controller = TextEditingController(text: widget.taskModel!.task);
    } else {
      controller = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlign: TextAlign.left, // Align text to the left by default
      // textDirection:
      //     TextDirection.ltr, // Set text direction to left-to-right by default
      // // keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      controller: controller,
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      cursorColor: k2Color,
      maxLines: widget.maxlines,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          
          labelText: widget.labal,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 22),
          border: builderBorder(),
          enabledBorder: builderBorder(),
          focusedBorder: builderBorder(k2Color)),
    );
  }

  OutlineInputBorder builderBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
