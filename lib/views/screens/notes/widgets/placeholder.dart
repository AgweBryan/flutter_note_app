import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/addNote/add_note_screen.dart';
import 'package:get/get.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () => Get.to(() => AddNoteScreen()),
                child: Image.asset('assets/placeholder.png')),
            CustomText(
                text: "No notes yet!\nClick add button to add a note",
                fontSize: 19),
          ],
        ),
      ),
    );
  }
}
