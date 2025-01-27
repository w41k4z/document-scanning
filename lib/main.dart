import 'package:camera/camera.dart';
import 'package:document_scanning/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Document scanner',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
          useMaterial3: true),
      home: Homescreen(_cameras),
    );
  }
}
