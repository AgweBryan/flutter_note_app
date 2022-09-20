import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/views/screens/notes/views_enum.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/detailed_view.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/grid_view.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/large_grid_view.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/list_view.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/staggered_view.dart';

class ShowNotes extends StatelessWidget {
  final Views view;
  ShowNotes({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case Views.detailed:
        return DetailedView(
          notes: dbController.notes,
        );
      case Views.grid:
        return GridViewView();
      case Views.largeGrid:
        return LargeGridView();
      case Views.list:
        return ListViewView();
      case Views.staggered:
        return StaggeredViewView();
      default:
        return StaggeredViewView();
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
