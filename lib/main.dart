import 'package:flutter/material.dart';
import 'package:flutter_note_app/helpers/db_helper.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/views/screens/navigation_tabs.dart';
import 'package:get/get.dart';

void main() {
  DatabaseHelper.initDb;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: NavigationTabs(),
    );
  }
}
