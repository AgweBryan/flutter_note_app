import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/views/screens/addNote/add_note_screen.dart';
import 'package:flutter_note_app/views/screens/calender/calender_screen.dart';
import 'package:flutter_note_app/views/screens/categories/categories_screen.dart';
import 'package:flutter_note_app/views/screens/notes/notes_screen.dart';
import 'package:flutter_note_app/views/screens/search/search_screen.dart';

final List<Widget> screens = [
  NotesScreen(),
  CategoriesScreen(),
  SearchScreen(),
  CalenderScreen(),
];
