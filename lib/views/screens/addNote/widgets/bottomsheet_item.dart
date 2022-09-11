import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/custom_text.dart';

class BottomsheetItem extends StatelessWidget {
  final Icon icon;

  final String label;

  const BottomsheetItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: CustomText(
        fontSize: 20,
        isTitle: true,
        text: label,
      ),
    );
  }
}
