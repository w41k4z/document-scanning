import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../recognizer/recognizer_screen.dart';

class AppFooterAction extends StatelessWidget {
  final ImagePicker imagePicker;
  final CameraController controller;

  const AppFooterAction(
      {super.key, required this.imagePicker, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child:
                  const Icon(Icons.rotate_left, size: 35, color: Colors.white),
              onTap: () => {},
            ),
            InkWell(
              child: const Icon(Icons.camera, size: 50, color: Colors.white),
              onTap: () async {
                await controller.takePicture().then((xFile) {
                  File image = File(xFile.path);
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return RecognizerScreen(image);
                  }));
                });
              },
            ),
            InkWell(
              child: const Icon(Icons.image, size: 35, color: Colors.white),
              onTap: () {
                imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((xFile) {
                  if (xFile != null) {
                    File image = File(xFile.path);
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return RecognizerScreen(image);
                    }));
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
