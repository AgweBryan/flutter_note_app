import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool? isBold;
  final bool? isTitle;
  CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.isBold = false,
      this.isTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: isTitle! ? 1 : 4,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.nunitoSans(
        fontSize: fontSize,
        fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
        color: isTitle! ? titleColor : textColor,
      ),
    );
  }
}
