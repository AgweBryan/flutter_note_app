import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/category.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/utils/custom_text.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/add_category.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/category_notes.dart';
import 'package:flutter_note_app/views/screens/categories/widgets/folder.dart';
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
                          label: category.categoryName!,
                          path: 'assets/category_icon.png'),
                    );
                  },
                ),
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
}
