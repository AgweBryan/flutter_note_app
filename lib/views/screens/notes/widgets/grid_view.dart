import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/addNote/edit_note_screen.dart';
import 'package:get/get.dart';

class GridViewView extends StatelessWidget {
  const GridViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      padding: EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: dbController.notes.length,
      itemBuilder: (context, i) {
        final Note note = dbController.notes[i];
        return _tile(note);
      },
    ));
  }

  _tile(Note note) {
    return GestureDetector(
      onTap: () => Get.to(() => EditNoteScreen(noteToEdit: note)),
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: noteColor[int.parse(note.noteColor!)],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: note.title!,
              fontSize: 15,
              isTitle: true,
              isBold: true,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              note.body!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
