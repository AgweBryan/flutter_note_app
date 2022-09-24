import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/add_note_controller.dart';
import 'package:flutter_note_app/models/category.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/message.dart';
import 'package:flutter_note_app/views/screens/addNote/widgets/bottomsheet_item.dart';
import 'package:flutter_note_app/views/screens/addNote/widgets/color_palette.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/add_category.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

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
  String selectedCategory =
      dbController.categories[dbController.categories.length - 1].categoryName!;

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
      body: Obx(() {
        return Padding(
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
                  InkWell(
                    onTap: () => _addNote(context),
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.save,
                            color: noteColor[colorIndex],
                          ),
                          Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16,
                              color: noteColor[colorIndex],
                            ),
                          ),
                        ],
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
                              value: selectedCategory,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: textColor,
                              ),
                              items:
                                  dbController.categories.map((Category item) {
                                return DropdownMenuItem(
                                  value: item.categoryName,
                                  child: Text(
                                    item.categoryName!,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      color: textColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue!;
                                });
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
                controller: _titleController,
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
                  controller: _noteController,
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
        );
      }),
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
          onPressed: () => Get.to(() => AddNewCategory()),
          icon: Icon(
            Icons.create_new_folder_rounded,
            color: textColor,
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
              onTap: () {
                _addNoteController.isPinned == 0
                    ? 0
                    : _addNoteController.updateIsPinned();
                _addNoteController.isFavorite == 0
                    ? 0
                    : _addNoteController.updateIsFavorite();
                _addNoteController.isArchived == 0
                    ? 0
                    : _addNoteController.updateIsArchived();
                setState(() {
                  _titleController.text = '';
                  _noteController.text = '';
                });
                Get.back();
              },
              icon: Icon(
                Icons.delete_outline_rounded,
                color: titleColor,
                size: 30,
              ),
              label: "Delete note",
            ),
            BottomsheetItem(
              onTap: () => _shareNote(),
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
                Get.back();
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
                Get.back();
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
                Get.back();
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

  _addNote(BuildContext context) async {
    if (_titleController.text == '') {
      customMessage(context: context, message: "Please enter a title");
    } else {
      final Note newNote = Note(
        id: DateTime.now().toString(),
        title: _titleController.text,
        body: _noteController.text,
        dateCreated: DateFormat.yMMMd().format(DateTime.now()),
        lastEdited: DateFormat.yMMMd().format(DateTime.now()),
        noteColor: colorIndex.toString(),
        category: selectedCategory,
        isArchive: _addNoteController.isArchived.toString(),
        isFavorite: _addNoteController.isFavorite.toString(),
        isPinned: _addNoteController.isPinned.toString(),
      );
      await dbController.insertNote(newNote);
      await dbController.getNotes();
      Get.back();
    }
  }

  _shareNote() async {
    await Share.share('${_titleController.text}\n${_noteController.text}');
  }
}
