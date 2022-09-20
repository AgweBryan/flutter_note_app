import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/custom_text.dart';

class LargeGridView extends StatelessWidget {
  const LargeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      padding: EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: dbController.notes.length,
      itemBuilder: (context, i) {
        final Note note = dbController.notes[i];
        return _tile(note);
      },
    ));
  }

  _tile(Note note) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: noteColor[int.parse(note.noteColor!)],
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: note.title!,
            fontSize: 17,
            isTitle: true,
          ),
          SizedBox(height: 10),
          CustomText(text: note.body!, fontSize: 14),
          Expanded(
            child: SizedBox(),
          ),
          CustomText(text: note.lastEdited!, fontSize: 11),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: titleColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FittedBox(
              child: CustomText(
                text: note.category!.toLowerCase().trim(),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
