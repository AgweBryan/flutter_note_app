import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/views/screens/addNote/edit_note_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewView extends StatelessWidget {
  const ListViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: dbController.notes.length,
      itemBuilder: (context, i) {
        final note = dbController.notes[i];
        return Card(
          color: noteColor[int.parse(note.noteColor!)],
          elevation: 7,
          child: ListTile(
              onTap: () => Get.to(() => EditNoteScreen(noteToEdit: note)),
              title: Text(
                note.title!,
                style: GoogleFonts.nunito(
                  fontSize: 17,
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                ),
              )),
        );
      },
    ));
  }
}
