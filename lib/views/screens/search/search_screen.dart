import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note.dart';
import 'package:flutter_note_app/utils/controller.dart';
import 'package:flutter_note_app/views/screens/notes/widgets/detailed_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Note> filteredList = [];

  void filterList(String value) {
    setState(() {
      filteredList = dbController.notes
          .where(
            (text) => text.title!.toLowerCase().trim().contains(
                  value.toLowerCase().trim(),
                ),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: filteredList.isEmpty
          ? Center(child: Text("Search Note title"))
          : Padding(
              padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
              child: Column(
                children: [
                  DetailedView(
                    notes: filteredList,
                  ),
                ],
              ),
            ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: ListTile(
          title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search note title...",
        ),
        onChanged: (value) => filterList(value),
      )),
    );
  }
}
