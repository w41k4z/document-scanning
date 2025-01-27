import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizerScreen extends StatefulWidget {
  final File image;

  const RecognizerScreen(this.image, {super.key});

  @override
  State<StatefulWidget> createState() => _RecognizerScreenState();
}

class _RecognizerScreenState extends State<RecognizerScreen> {
  // late TextRecognizer textRecognizer;
  String result = '';

  @override
  initState() {
    super.initState();
    // textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    // recognize();
    processRecognition();
  }

  processRecognition() async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(widget.image);
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          result += '${word.text} ';
        }
        result += '\n';
      }
    }
    setState(() {});
  }

  recognize() async {
    // InputImage inputImage = InputImage.fromFile(widget.image);
    // final RecognizedText recognizedText =
    //     await textRecognizer.processImage(inputImage);

    // String text = recognizedText.text;
    // setState(() {
    //   result = text;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Recognizer'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.file(widget.image),
              Card(
                margin: const EdgeInsets.all(10),
                color: Colors.grey.shade300,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blueAccent,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Result',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.document_scanner,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
