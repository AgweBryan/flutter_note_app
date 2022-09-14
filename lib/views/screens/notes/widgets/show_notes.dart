import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/views/screens/notes/views_enum.dart';

class ShowNotes extends StatelessWidget {
  final Views view;
  ShowNotes({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case Views.detailed:
        return Text('detailed');
      case Views.grid:
        return Text('grid');
      case Views.largeGrid:
        return Text('largeGrid');
      case Views.list:
        return Text('list');
      case Views.staggered:
        return Text('staggered');
      default:
        return Text('staggered');
    }
    // return Expanded(
    //     child: ListView.builder(
    //   itemCount: dbController.notes.length,
    //   itemBuilder: (context, i) {
    //     final note = dbController.notes[i];
    //     return ListTile(
    //       title: Text(note.title!),
    //       subtitle: Text(note.body!),
    //     );
    //   },
    // ));
  }
}
