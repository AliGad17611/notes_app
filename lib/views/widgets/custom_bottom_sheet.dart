import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_textfield.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 450,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: const Column(
          children: [
            CustomTextField(
              hintText: "Enter Note Title",
            ),
            Spacer(
              flex: 2,
            ),
            CustomTextField(
              hintText: "Enter Note Content",
              maxlines: 6,
            ),
            Spacer(
              flex: 6,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
