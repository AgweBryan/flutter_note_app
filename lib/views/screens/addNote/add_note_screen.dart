import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                ),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "your note..."),
              ))
            ],
          ),
        ));
  }

  _appBar() {
    return AppBar(
      title: const Text("Add new note"),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
