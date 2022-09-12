import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/add_note_controller.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/views/screens/addNote/widgets/bottomsheet_item.dart';
import 'package:flutter_note_app/views/screens/addNote/widgets/color_palette.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool isBackgroundColor = true;
  int colorIndex = 0;
  Color get color => isBackgroundColor ? textColor : Colors.black;

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
      backgroundColor: noteColor[colorIndex].withOpacity(.7),
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    DateFormat.yMMMd().format(
                      DateTime.now(),
                    ),
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder,
                        color: textColor,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: "Note",
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: textColor,
                            ),
                            items: ["Note", "School", "shopping"]
                                .map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 16,
                                    color: textColor,
                                  ),
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
              cursorColor: color,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                  hintStyle: TextStyle(color: textColor)),
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: color),
            ),
            Expanded(
              child: TextField(
                cursorColor: color,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(fontSize: noteFontSize, color: color),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: textColor,
                    ),
                    border: InputBorder.none,
                    hintText: "your note..."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_rounded,
          color: textColor,
        ),
      ),
      title: Text(
        "Add new note",
        style: TextStyle(color: textColor),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => updateNoteFontSize(),
          icon: Icon(
            Icons.format_size_rounded,
            color: textColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.done,
            color: primaryColor,
          ),
        ),
        IconButton(
          onPressed: () => _showBottomSheet(context),
          icon: Icon(
            Icons.more_vert_rounded,
            color: textColor,
          ),
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
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      colorIndex = i;
                      isBackgroundColor = colorIndex == 0 ? true : false;
                    });
                    _addNoteController.updateSelectedNoteColor(colorIndex);
                  },
                  child: ColorPalette(
                    index: i,
                  ),
                ),
              ),
            ),
            BottomsheetItem(
              onTap: () => Get.back(),
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
