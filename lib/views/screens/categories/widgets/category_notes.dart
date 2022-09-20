import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/detailed_view.dart';

class CategoryNotes extends StatefulWidget {
  final String catName;
  const CategoryNotes({Key? key, required this.catName}) : super(key: key);

  @override
  State<CategoryNotes> createState() => _CategoryNotesState();
}

class _CategoryNotesState extends State<CategoryNotes> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    notes = dbController.notes
        .where((element) => element.category! == widget.catName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: notes.isEmpty
          ? Center(child: Text("No note under this category"))
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
      title: Text('${widget.catName} notes'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
    );
  }
}
