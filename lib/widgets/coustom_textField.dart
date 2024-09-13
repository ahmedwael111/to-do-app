import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class CostomTextFormField extends StatelessWidget {
  const CostomTextFormField(
      {super.key,
      required this.hint,
      this.maxlines = 1,
      this.onSaved,
      this.onChanged,
      this.labal});
  final String hint;
  final int maxlines;
  final String? labal;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlign: TextAlign.left, // Align text to the left by default
      // textDirection:
      //     TextDirection.ltr, // Set text direction to left-to-right by default
      // // keyboardType: TextInputType.text,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      cursorColor:k2Color,
      maxLines: maxlines,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          hintText: hint,
          labelText: labal,
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
