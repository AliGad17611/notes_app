import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/views/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, this.selectedIndex = 0});

  final int selectedIndex;

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
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
              BlocProvider.of<AddNoteCubit>(context).selectedColor =
                  kColorsList[index];
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
