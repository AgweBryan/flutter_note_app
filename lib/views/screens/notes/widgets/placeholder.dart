import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/custom_text.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/placeholder.gif'),
            CustomText(
                text: "No notes yet!\nClick add button to add a note",
                fontSize: 13),
          ],
        ),
      ),
    ));
  }
}
