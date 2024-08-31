import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxlines = 1,
  });
  final String hintText;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
