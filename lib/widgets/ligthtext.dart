import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget lightText(String text, double screenHeight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: screenHeight / 55, color: AppColors.lightText),
  );
}
