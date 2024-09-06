import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});
  final Color color ;
  final bool isSelected ;


  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: isSelected ? 38 : 36,
      backgroundColor: Colors.white,
      child:  CircleAvatar(
        radius: 36,
        backgroundColor: color,
      ),
    );
  }
}
