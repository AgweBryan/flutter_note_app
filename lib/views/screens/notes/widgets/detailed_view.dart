import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/views/screens/addNote/edit_note_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedView extends StatelessWidget {
  final List<Note> notes;
  DetailedView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: notes.length,
      itemBuilder: (context, i) {
        final note = notes[i];
        return Card(
          color: noteColor[int.parse(note.noteColor!)],
          elevation: 7,
          child: ListTile(
            onTap:() => Get.to(() => EditNoteScreen(noteToEdit: note)),
            title: Text(
              note.title!,
              style: GoogleFonts.nunito(
                fontSize: 17,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              note.body!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                color: titleColor,
              ),
            ),
            trailing: Text(note.lastEdited!),
          ),
        );
      },
    ));
  }
}
