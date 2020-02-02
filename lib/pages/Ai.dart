import 'dart:io';
import 'dart:ui' as ui;
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/FacePainter.dart';

class AiPage extends StatefulWidget {
  @override
  _AiPageState createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  bool loading = true;
  bool startProssess = false;
  ui.Image imageToPaint;
  List<Face> _faces;

  Future<ui.Image> _loadImage(File file) async {
    final data = await file.readAsBytes();
    return await decodeImageFromList(data);
  }

  void _imageVisionWithDetection() async {
    setState(() {
      startProssess = true;
    });
    //? Get Image From the Gallery
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    //? Pass the image to FirebaseVisionImage
    final image = FirebaseVisionImage.fromFile(imageFile);

    //? Pass the image to FirebaseVision
    final faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
          enableLandmarks: true, mode: FaceDetectorMode.accurate),
    );
    final faces = await faceDetector.processImage(image);
    imageToPaint = await _loadImage(imageFile);

    setState(() {
      _faces = faces;
      startProssess = false;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utiliser AI"),
        leading: Icon(FontAwesomeIcons.brain),
      ),
      body: Center(
        child: loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.cameraRetro,
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  startProssess
                      ? SpinKitCircle(
                          color: Color(0xff42a5f5),
                          size: 50.0,
                        )
                      : Text(
                          "No Image Selected",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                ],
              )
            : FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: imageToPaint.width.toDouble(),
                  height: imageToPaint.height.toDouble(),
                  child: FacePaint(
                    painter: SmilePainter(imageToPaint, _faces),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Pick an Image',
        backgroundColor: Color(0xff42a5f5),
        onPressed: _imageVisionWithDetection,
        child: Icon(FontAwesomeIcons.camera),
      ),
    );
  }
}
