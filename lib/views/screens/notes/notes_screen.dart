import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/notes_controller.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:get/get.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);

  final NotesController _notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _notesController.myNotes.isEmpty
                  ? Placeholder()
                  : Text("has Data"),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: CustomText(
        text: "My Notes",
        fontSize: 30,
        isBold: true,
        isTitle: true,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
    );
  }
}
