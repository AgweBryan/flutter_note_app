import 'package:flutter_note_app/models/category.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/message.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;
  static final String _path = "notes.db";
  static final int _version = 1;
  static final String _categoriesTableName = "Categories";
  static final String _notesTableName = "Notes";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + _path;

      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          db.execute('''
          CREATE TABLE $_categoriesTableName(
          id STRING PRIMARY KEY,
          categoryName TEXT)
          ''');
          db.execute('''
          CREATE TABLE $_notesTableName(
          id STRING PRIMARY KEY,
          title TEXT, body TEXT, dateCreated TEXT, lastEdited TEXT, 
          noteColor TEXT, category TEXT, isArchive TEXT, isPinned TEXT, isFavorite TEXT)
          ''');
        },
      );

      await insertCategory(
        Category(categoryName: "uncategorized", id: DateTime.now().toString()),
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<int> insertCategory(Category category) async {
    final tables = await _db!.rawQuery(
        '''SELECT * FROM $_categoriesTableName WHERE categoryName='${category.categoryName}';''');

    if (tables.isNotEmpty) {
      Get.snackbar('Error', 'Category already exists');
      return 0;
    }

    return await _db!.insert(_categoriesTableName, category.toMap());
  }

  static Future<List<Map<String, dynamic>>> queryCategories() async {
    return await _db!.query(_categoriesTableName);
  }

  static Future<List<Map<String, dynamic>>> queryNotes() async {
    return await _db!.query(_notesTableName);
  }

  static Future<int> insertNote(Note note) async {
    return await _db!.insert(_notesTableName, note.toMap());
  }

  static Future<int> deleteNote(String id) async {
    return await _db!.delete(_notesTableName, where: 'id=?', whereArgs: [id]);
  }

  static Future<int> deleteCategory(String id) async {
    return await _db!
        .delete(_categoriesTableName, where: 'id=?', whereArgs: [id]);
  }
}
