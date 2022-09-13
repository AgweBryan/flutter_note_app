import 'package:flutter/material.dart';
import 'package:flutter_note_app/controllers/database_controller.dart';
import 'package:flutter_note_app/helpers/db_helper.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/views/screens/navigation_tabs.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DatabaseController());
    return GetMaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: NavigationTabs(),
    );
  }
}
