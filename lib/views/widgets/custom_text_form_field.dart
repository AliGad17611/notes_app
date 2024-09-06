import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.maxlines = 1,
    this.onSaved,
    this.initialValue,
  });
  final String hintText;
  final int maxlines;
  final void Function(String?)? onSaved;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: initialValue,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        cursorColor: kPrimaryColor,
        maxLines: maxlines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide.none),
          hintText: hintText,
        ));
  }
}
