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
    required this.isEditing,
  });
  final bool isEditing; // flag to distinguish between add or edit.
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
  TextAlign textAlign = TextAlign.left;

  @override
  void initState() {
    if (widget.taskModel != null) {
      controller = TextEditingController(text: widget.taskModel!.task);
      _setInitialTextAlign(widget.taskModel!.task);
    } else {
      controller = TextEditingController();
    }
    super.initState();
  }

  // Function to detect if the entered text is in Arabic
  bool _isArabic(String input) {
    final RegExp arabic = RegExp(r'[\u0600-\u06FF]');
    return arabic.hasMatch(input);
  }

  // Set initial text alignment based on the provided text
  void _setInitialTextAlign(String text) {
    if (_isArabic(text)) {
      textAlign = TextAlign.right;
    } else {
      textAlign = TextAlign.left;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      // Handling onChanged only in editing mode
      onChanged: (value) {
        setState(() {
          _setInitialTextAlign(value);
        });
        if (widget.isEditing) {
          widget.onChanged?.call(value);
        }
      },
      // Handling onSaved only in adding mode
      onSaved: (newValue) {
        if (!widget.isEditing) {
          widget.onSaved?.call(newValue);
        }
      },
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
          labelStyle: const TextStyle(color: k2Color, fontSize: 18),
          border: builderBorder(),
          enabledBorder: builderBorder(),
          focusedBorder: builderBorder(k2Color)),
    );
  }

  OutlineInputBorder builderBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
