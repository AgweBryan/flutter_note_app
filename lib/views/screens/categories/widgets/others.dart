import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/detailed_view.dart';

class Others extends StatelessWidget {
  final String label;
  final List<Note> notes;
  const Others({Key? key, required this.notes, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: notes.isEmpty
          ? Center(child: Text("Nothing here yet!"))
          : Padding(
              padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
              child: Column(
                children: [
                  DetailedView(
                    notes: notes,
                  ),
                ],
              ),
            ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('$label notes'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
    );
  }
}
