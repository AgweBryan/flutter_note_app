import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/category.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/add_category.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/category_notes.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/folder.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/others.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dbController.categories.length + 1,
                  itemBuilder: (context, i) {
                    int count = i == 0 ? 0 : i - 1;
                    final Category category = dbController.categories[count];
                    if (i == 0) {
                      return GestureDetector(
                        onTap: () => Get.to(() => AddNewCategory()),
                        child: Folder(
                          label: 'Add Category',
                          path: 'assets/add_cat.png',
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () => Get.to(
                          () => CategoryNotes(catName: category.categoryName!)),
                      child: Folder(
                          label:
                              '${category.categoryName!} (${getNumberOfNotes(category.categoryName!)})',
                          path: 'assets/category_icon.png'),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () => Get.to(
                    () => Others(notes: dbController.notes, label: 'All')),
                leading: Icon(Icons.notes_rounded),
                title: Text('All notes'),
                trailing: Text(dbController.notes.length.toString()),
              ),
              ListTile(
                onTap: () => Get.to(() => Others(
                    notes: dbController.notes
                        .where((element) => element.isFavorite == '1')
                        .toList(),
                    label: 'Favorite')),
                leading: Icon(Icons.star_border_rounded),
                title: Text('Favorite notes'),
                trailing: Text(dbController.notes
                    .where((element) => element.isFavorite == '1')
                    .toList()
                    .length
                    .toString()),
              ),
              ListTile(
                onTap: () => Get.to(() => Others(
                    notes: dbController.notes
                        .where((element) => element.isArchive == '1')
                        .toList(),
                    label: 'Archived')),
                leading: Icon(Icons.archive_outlined),
                title: Text('Archived notes'),
                trailing: Text(dbController.notes
                    .where((element) => element.isArchive == '1')
                    .toList()
                    .length
                    .toString()),
              ),
              ListTile(
                onTap: () => Get.to(() => Others(
                    notes: dbController.notes
                        .where((element) => element.isPinned == '1')
                        .toList(),
                    label: 'Pinned')),
                leading: Icon(Icons.push_pin_rounded),
                title: Text('Pinned notes'),
                trailing: Text(dbController.notes
                    .where((element) => element.isPinned == '1')
                    .toList()
                    .length
                    .toString()),
              ),
            ],
          ),
        );
      }),
    );
  }

  _appBar() {
    return AppBar(
      title: CustomText(
        text: "Categories",
        fontSize: 30,
        isBold: true,
        isTitle: true,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
    );
  }

  getNumberOfNotes(String catName) {
    return dbController.notes
        .where((element) => element.category == catName)
        .toList()
        .length;
  }
}
