import 'package:flutter_note_app/helpers/db_helper.dart';
import 'package:flutter_note_app/models/category.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  static final DatabaseController instance = Get.find();

  final Rx<List<Category>> _categories = Rx<List<Category>>([]);

  final Rx<List<Note>> _notes = Rx<List<Note>>([]);

  List<Note> get notes => _notes.value;

  List<Category> get categories => _categories.value;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getNotes();
  }

  getCategories() async {
    final List<Category> categoriesFromDb = [];

    final myCategories = await DatabaseHelper.queryCategories();

    categoriesFromDb.addAll(myCategories.reversed
        .map((data) => Category().fromJson(data))
        .toList());
    _categories.value = categoriesFromDb;
  }

  getNotes() async {
    final List<Note> notesFromDb = [];

    final myNotes = await DatabaseHelper.queryNotes();

    notesFromDb
        .addAll(myNotes.reversed.map((data) => Note().fromJson(data)).toList());

    _notes.value = notesFromDb;
  }
}