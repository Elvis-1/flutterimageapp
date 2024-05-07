import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/screens/home/dashboard_screen.dart';
import 'package:flutterimageapp/widgets/appbar.dart';
import 'package:flutterimageapp/widgets/ligthtext.dart';
import 'package:flutterimageapp/widgets/verification_btn.dart';

class FaceVerificationUnsuccessfulScreen extends StatefulWidget {
  FaceVerificationUnsuccessfulScreen({super.key, required this.imageFile});
  XFile imageFile;

  @override
  State<FaceVerificationUnsuccessfulScreen> createState() =>
      _FaceVerificationUnsuccessfulScreenState();
}

class _FaceVerificationUnsuccessfulScreenState
    extends State<FaceVerificationUnsuccessfulScreen> {
  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context),
        body: Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: screenHeight / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth / 15)),
                  child: Image.file(
                    File(
                      widget.imageFile.path,
                    ),
                    fit: BoxFit.cover,
                  )),

              SizedBox(
                height: screenHeight / 40,
              ),
              const Text(
                "We couldn't verify your face.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: screenHeight / 50,
              ),
              lightText(
                  "Don't worry, your request for attendance has been sent to the head of department for approval",
                  screenHeight),
              SizedBox(
                height: screenHeight / 50,
              ),
              lightText(
                  "Go to dashboard and continue with your task for the day once your attendance is approved",
                  screenHeight),
              Expanded(child: Container()),

              // divider
              const Divider(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const DashboardScreen()));
                  },
                  child: verificationBtn(
                      screenHeight, screenWidth, "Go to Dashboard")),
            ],
          ),
        ));
  }
}
