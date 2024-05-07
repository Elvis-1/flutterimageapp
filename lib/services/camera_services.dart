import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterimageapp/widgets/show_snackbar.dart';

class CameraServices {
  static Future<XFile?> takePicture(
      CameraController controller, BuildContext context) async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.', context);
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      // print('----- taking picture ------');
      // print(file);
      return file;
    } on CameraException catch (e) {
      //  _showCameraException(e);
      return null;
    }
  }
}
