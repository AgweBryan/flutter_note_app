import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/notes/views_enum.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/placeholder.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/show_notes.dart';
import 'package:get/get.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _quickNoteController = TextEditingController();
  bool isQuickNote = false;
  double quikNoteHeight = 60;

  Views view = Views.staggered;

  @override
  void dispose() {
    super.dispose();
    _quickNoteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isQuickNote
                  ? Row(
                      children: [
                        Expanded(child: SizedBox()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isQuickNote = false;
                              quikNoteHeight = 60;
                              _quickNoteController.text = "";
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.pink,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _addQuickNote(),
                          icon: Icon(
                            Icons.save,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                width: double.infinity,
                height: quikNoteHeight,
                decoration: BoxDecoration(
                  color: navBarBckColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _quickNoteController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Quick note",
                    border: InputBorder.none,
                  ),
                  onTap: () => setState(() {
                    isQuickNote = true;
                    quikNoteHeight = 90;
                  }),
                ),
              ),
              dbController.notes.isEmpty
                  ? PlaceHolder()
                  : ShowNotes(
                      view: view,
                    ),
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
        DropdownButtonHideUnderline(
          child: DropdownButton(
              value: _displayedView(),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: titleColor,
              ),
              items: [
                'list',
                'detailed',
                'grid',
                'large-grid',
                'staggered',
              ].map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: CustomText(
                    text: item,
                    fontSize: 20,
                    isTitle: true,
                  ),
                );
              }).toList(),
              onChanged: _selectedView),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
    );
  }

  _addQuickNote() async {
    final Note quickNote = Note(
      id: DateTime.now().toString(),
      title: "Quick Note",
      body: _quickNoteController.text,
      dateCreated: DateTime.now().toString(),
      lastEdited: DateTime.now().toString(),
      noteColor: '0',
      category: 'uncategorized',
      isArchive: '0',
      isFavorite: '0',
      isPinned: '0',
    );
    await dbController.insertNote(quickNote);
    await dbController.getNotes();
    setState(() {
      isQuickNote = false;
      quikNoteHeight = 60;
      _quickNoteController.text = "";
    });
  }

  String _displayedView() {
    switch (view) {
      case Views.detailed:
        return 'detailed';
      case Views.staggered:
        return 'staggered';
      case Views.grid:
        return 'grid';
      case Views.largeGrid:
        return 'large-grid';
      case Views.list:
        return 'list';
      default:
        return 'staggered';
    }
  }

  void _selectedView(String? value) {
    switch (value) {
      case 'detailed':
        setState(() {
          view = Views.detailed;
        });
        break;
      case 'list':
        setState(() {
          view = Views.list;
        });
        break;
      case 'staggered':
        setState(() {
          view = Views.staggered;
        });
        break;
      case 'grid':
        setState(() {
          view = Views.grid;
        });
        break;
      case 'large-grid':
        setState(() {
          view = Views.largeGrid;
        });
        break;
    }
  }
}
