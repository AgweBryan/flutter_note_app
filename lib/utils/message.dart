import 'package:flutter/material.dart';

customMessage({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
