import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/views/widgets/custom_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        right: 4,
      ),
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) {
                return const CustomBottomSheet();
              });
        },
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
