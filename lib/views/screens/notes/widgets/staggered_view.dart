import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/addNote/edit_note_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class StaggeredViewView extends StatelessWidget {
  const StaggeredViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(top: 10),
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        itemCount: dbController.notes.length,
        itemBuilder: (context, i) {
          final note = dbController.notes[i];
          return _tile(note);
        },
      ),
    );
  }

  _tile(Note note) {
    return GestureDetector(
      onTap: () => Get.to(() => EditNoteScreen(noteToEdit: note)),
      child: Container(
        decoration: BoxDecoration(
          color: noteColor[int.parse(note.noteColor!)],
          borderRadius: BorderRadius.circular(
            17,
          ),
        ),
        padding: EdgeInsets.all(12),
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
      ),
    );
  }
}
