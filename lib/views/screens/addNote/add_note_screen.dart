import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:intl/intl.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: CustomText(
                    isTitle: true,
                    fontSize: 16,
                    text: DateFormat.yMMMd().format(
                      DateTime.now(),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: "Note",
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ),
                            items: ["Note", "School", "shopping"]
                                .map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: CustomText(
                                  text: item,
                                  fontSize: 16,
                                  isTitle: true,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // todo: change value
                              print(newValue);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: const Text("Add new note"),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
