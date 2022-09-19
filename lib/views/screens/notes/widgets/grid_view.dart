import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/controller.dart';

class GridViewView extends StatelessWidget {
  const GridViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: dbController.notes.length,
      itemBuilder: (context, i) => _tile(),
    ));
  }

  _tile() {
    return Container(
      color: Colors.red,
    );
  }
}
