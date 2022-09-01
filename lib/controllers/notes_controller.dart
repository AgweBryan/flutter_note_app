import 'package:flutter_note_app/models/note.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  final Rx<List<Note>> _myNotes = Rx<List<Note>>([]);

  List<Note> get myNotes => _myNotes.value;
}
