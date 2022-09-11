import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/colors.dart';

class ColorPalette extends StatelessWidget {
  final int index;
  const ColorPalette({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.5),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey, width: 2),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: noteColor[index],
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.done,
          color: Colors.green,
        ),
      ),
    );
  }
}
