import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget verificationBtn(double screenHeight, double screenWidth, String text) {
  return Container(
    width: screenHeight,
    height: screenHeight / 20,
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(screenWidth / 25)),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
    )),
  );
}
