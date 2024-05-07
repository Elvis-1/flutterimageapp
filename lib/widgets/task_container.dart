import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/widgets/icon_text_btn.dart';

import '../constants/app_colors.dart';

Widget taskContainer(
  double screenWidth,
  double screenHeight, {
  Color btnColor = Colors.white,
  bool isBtn = true,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: screenHeight / 50, vertical: screenHeight / 40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight / 50),
        border: Border.all(color: AppColors.lightText)),
    child: Column(
      children: [
        // first row
        Row(
          children: [
            Container(
              height: screenHeight / 50,
              color: AppColors.greyColor,
              width: screenWidth / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/routine.png"),
                  Text(
                    "Rajesh",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            ),
            SizedBox(
              width: screenWidth / 50,
            ),
            Container(
              color: AppColors.greyColor,
              child: Text(
                "Not Accepted",
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
            SizedBox(
              width: screenWidth / 50,
            ),
            Image.asset("assets/icons/schedule.png"),
            Expanded(child: Container()),
            Container(
              height: screenHeight / 50,
              width: screenWidth / 5.5,
              color: AppColors.lightGreenColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icons/time.png",
                    color: AppColors.darkGreenColor,
                  ),
                  Text(
                    "20mins,",
                    style: TextStyle(color: AppColors.darkGreenColor),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: screenHeight / 50,
        ),
        // second row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Routine cleaning",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Container(
              color: AppColors.greyColor,
              child: Text(
                "Guess Task",
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight / 50,
        ),
        // third row
        Row(
          children: [
            Image.asset("assets/icons/calendar.png"),
            Text("21 Jul 2024 | 03:00 am"),
            Expanded(child: Container()),
            Text(
              "#68988",
              style: TextStyle(color: AppColors.lightText),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight / 50,
        ),
        // fourth row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "From:Pantry",
              style: TextStyle(color: AppColors.darkGrey, fontSize: 20),
            ),
            Text(
              "To:Reception",
              style: TextStyle(color: AppColors.darkGrey, fontSize: 20),
            ),
          ],
        ),
        isBtn
            ? SizedBox(
                height: screenHeight / 50,
              )
            : SizedBox.shrink(),
        // icon and text button
        isBtn
            ? iconAndTextBtn(screenWidth, screenHeight, btnColor)
            : const SizedBox.shrink()
      ],
    ),
  );
}
