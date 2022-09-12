import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/add_note_controller.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:get/get.dart';

class ColorPalette extends StatelessWidget {
  final int index;
  ColorPalette({
    Key? key,
    required this.index,
  }) : super(key: key);

  final AddNoteController _addNoteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          child: _addNoteController.selectedNoteColor == index
              ? Icon(
                  Icons.done,
                  color: primaryColor,
                )
              : SizedBox(),
        ),
      );
    });
  }
}
