import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/constants/app_colors.dart';
import 'dart:async';

import 'package:flutterimageapp/screens/verifications/submit_face_screen.dart';
import 'package:flutterimageapp/services/camera_services.dart';

class NumberWithProgressBar extends StatefulWidget {
  NumberWithProgressBar({required this.controller});
  CameraController controller;
  @override
  _NumberWithProgressBarState createState() => _NumberWithProgressBarState();
}

class _NumberWithProgressBarState extends State<NumberWithProgressBar> {
  int count = 0;
  Timer? _timer;
  XFile? imageFile;

  void startCounting() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) async {
      if (count == 100) {
        timer.cancel();

        CameraServices.takePicture(widget.controller, context).then((value) {
          imageFile = value;
          print('-- printign form num screen -');
          print(imageFile);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SubmitFaceScreen(
                      imageFile: imageFile!,
                    )),
          );
        });
      } else {
        setState(() {
          count++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startCounting();
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          '$count% Scanning',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: screenHeight / 50),
        Container(
          margin: EdgeInsets.only(bottom: screenHeight / 50),
          width: screenWidth / 1.4,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(15),
            value: count / 100,
            minHeight: 10,
            backgroundColor:
                Colors.grey[300], // Background color of the progress bar
            valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.primaryColor), // Color of the progress bar
          ),
        ),
      ],
    );
  }
}
