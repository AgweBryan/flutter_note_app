import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/notes_controller.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/placeholder.dart';
import 'package:get/get.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final NotesController _notesController = Get.put(NotesController());

  final TextEditingController _quickNoteController = TextEditingController();
  bool isQuickNote = false;
  double quikNoteHeight = 60;

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
                          onPressed: () {},
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
                  color: Color(0xFF3e3e3e),
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
              _notesController.myNotes.isEmpty
                  ? PlaceHolder()
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
