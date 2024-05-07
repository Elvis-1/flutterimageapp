import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget iconAndTextBtn(double screenWidth, double screenHeight, Color btnColor,
    [Color btnBorderColor = Colors.white]) {
  return Container(
    width: screenWidth,
    height: screenHeight / 20,
    decoration: BoxDecoration(
        border: Border.all(color: btnBorderColor),
        color: btnColor,
        borderRadius: BorderRadius.circular(screenHeight / 40)),
    child: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/time.png",
          color: AppColors.lightPrimary,
        ),
        SizedBox(
          width: screenWidth / 50,
        ),
        Text(
          "Notify Staff",
          style: TextStyle(
              fontSize: screenWidth / 20, color: AppColors.lightPrimary),
        ),
      ],
    )),
  );
}
