import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/color_item.dart';

class EditViewColorsListView extends StatefulWidget {
  const EditViewColorsListView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewColorsListView> createState() => _EditViewColorsListViewState();

}

class _EditViewColorsListViewState extends State<EditViewColorsListView> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = kColorsList.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedIndex = index;
            setState(() {
              widget.note.color = kColorsList[index].value;
            });
          },
          child: ColorItem(
            color: kColorsList[index],
            isSelected: index == selectedIndex,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: kColorsList.length,
      ),
    );
  }
}
