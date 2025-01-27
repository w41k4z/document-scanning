import 'package:camera/camera.dart';
import 'package:document_scanning/screens/home/app_footer_action.dart';
import 'package:document_scanning/screens/home/app_header_action.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homescreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const Homescreen(this.cameras, {super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late ImagePicker imagePicker;
  late CameraController controller;
  int currentIndex = 0;

  @override
  initState() {
    super.initState();
    imagePicker = ImagePicker();
    controller =
        CameraController(widget.cameras[currentIndex], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 2, right: 2),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppHeaderAction(imagePicker: imagePicker),
            Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: controller.value.isInitialized
                    ? CameraPreview(controller)
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
            AppFooterAction(
              imagePicker: imagePicker,
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
