import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    title: const Text("Face Verification"),
    leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new)),
  );
}
