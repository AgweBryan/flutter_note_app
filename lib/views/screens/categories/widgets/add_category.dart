import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/category.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:get/get.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({Key? key}) : super(key: key);

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new category'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/category_icon.png'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Category name',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton.icon(
              onPressed: () async {
                await dbController.insertCategory(
                    Category(
                      id: DateTime.now().toString(),
                      categoryName: controller.text,
                    ),
                    context);
                dbController.getCategories();
                Get.back();
              },
              icon: Icon(Icons.folder),
              label: Text('Add Category'))
        ],
      ),
    );
  }
}
