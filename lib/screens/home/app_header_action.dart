import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppHeaderAction extends StatelessWidget {
  final ImagePicker imagePicker;

  const AppHeaderAction({super.key, required this.imagePicker});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 70,
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.scanner, size: 25, color: Colors.white),
                  Text(
                    'Scan',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () => {},
            ),
            InkWell(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.document_scanner, size: 25, color: Colors.white),
                  Text(
                    'Recognize',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () => {},
            ),
            InkWell(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_sharp, size: 25, color: Colors.white),
                  Text(
                    'Enhance',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
