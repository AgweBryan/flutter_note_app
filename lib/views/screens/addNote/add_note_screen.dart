import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/add_note_controller.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/addNote/widgets/bottomsheet_item.dart';
import 'package:flutter_note_app/views/screens/addNote/widgets/color_palette.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final AddNoteController _addNoteController = Get.put(AddNoteController());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  double noteFontSize = 16;
  updateNoteFontSize() {
    if (noteFontSize > 26) {
      setState(() {
        noteFontSize = 16;
      });
    } else {
      setState(() {
        noteFontSize += 2;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
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
                style: TextStyle(fontSize: noteFontSize),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "your note..."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Add new note"),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => updateNoteFontSize(),
          icon: Icon(Icons.format_size_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.done,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: () => _showBottomSheet(context),
          icon: Icon(Icons.more_vert_rounded),
        )
      ],
    );
  }

  _showBottomSheet(BuildContext context) {
    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: 10, right: 10, bottom: 5, left: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: navBarBckColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.only(right: 5),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: noteColor.length,
                itemBuilder: (context, i) => ColorPalette(
                  index: i,
                ),
              ),
            ),
            BottomsheetItem(
              onTap: () {},
              icon: Icon(
                Icons.delete_outline_rounded,
                color: titleColor,
                size: 30,
              ),
              label: "Delete note",
            ),
            BottomsheetItem(
              onTap: () {},
              icon: Icon(
                Icons.share_outlined,
                color: titleColor,
                size: 30,
              ),
              label: "Share note",
            ),
            BottomsheetItem(
              onTap: () {
                _addNoteController.updateIsPinned();
              },
              icon: Icon(
                Icons.push_pin_outlined,
                color: titleColor,
                size: 30,
              ),
              label: "Pin note",
            ),
            BottomsheetItem(
              onTap: () {
                _addNoteController.updateIsFavorite();
              },
              icon: Icon(
                Icons.star_border_rounded,
                color: titleColor,
                size: 30,
              ),
              label: "Add to favorites",
            ),
            BottomsheetItem(
              onTap: () {
                _addNoteController.updateIsArchived();
              },
              icon: Icon(
                Icons.archive_outlined,
                color: titleColor,
                size: 30,
              ),
              label: "Archive note",
            ),
          ],
        ),
      ),
    );
  }
}
