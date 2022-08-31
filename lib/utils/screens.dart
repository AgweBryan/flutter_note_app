import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/views/screens/addNote/add_note_screen.dart';
import 'package:flutter_note_app/views/screens/favorites/favorites_screen.dart';
import 'package:flutter_note_app/views/screens/notes/notes_screen.dart';
import 'package:flutter_note_app/views/screens/search/search_screen.dart';

const List<Widget> screens = [
  NotesScreen(),
  SearchScreen(),
  FavoritesScreen(),
  AddNoteScreen(),
];
