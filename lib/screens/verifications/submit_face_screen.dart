// import 'package:camera/camera.dart';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutterimageapp/screens/verifications/face_verification_unsucessful_screen.dart';
import 'package:flutterimageapp/widgets/appbar.dart';
import 'package:flutterimageapp/widgets/verification_btn.dart';

class SubmitFaceScreen extends StatefulWidget {
  SubmitFaceScreen({super.key, required this.imageFile});
  XFile imageFile;

  @override
  State<SubmitFaceScreen> createState() => _SubmitFaceScreenState();
}

class _SubmitFaceScreenState extends State<SubmitFaceScreen> {
  @override
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
              // SizedBox(
              //   height: screenHeight / 5,
              // ),

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
                "Face Verified Successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),

              // divider
              const Divider(),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FaceVerificationUnsuccessfulScreen(
                                    imageFile: widget.imageFile)));
                  },
                  child: verificationBtn(screenHeight, screenWidth, "Submit")),
            ],
          ),
        ));
  }
}
