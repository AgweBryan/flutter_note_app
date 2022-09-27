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

  Future<int> insertNote(Note note) async {
    return await DatabaseHelper.insertNote(note);
  }

  Future<int> deleteNote(String id) async {
    return await DatabaseHelper.deleteNote(id);
  }

  Future<int> insertCategory(Category category) async {
    return await DatabaseHelper.insertCategory(category);
  }

  Future<int> deleteCategory(String id) async {
    return await DatabaseHelper.deleteCategory(id);
  }

  Future<int> editNote(Note note) async {
    return await DatabaseHelper.editNote(note);
  }
}
