import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'cameratwo.dart';
// import 'bndbox.dart';
import 'models.dart';
import 'recognition.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    res = await Tflite.loadModel(
        model: "assets/model_dantochoc.tflite",
        labels: "assets/model_dantochoc.txt");
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: const Text("Start"),
                    onPressed: () => onSelect(ssd),
                  ),
                ],
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  flex: 8, // 80%
                  child: Camera(
                    widget.cameras,
                    _model,
                    setRecognitions,
                  ),
                ),

                // BndBox(
                //     _recognitions == null ? [] : _recognitions,
                //     math.max(_imageHeight, _imageWidth),
                //     math.min(_imageHeight, _imageWidth),
                //     screen.height,
                //     screen.width,
                //     _model),
                Expanded(
                  flex: 1, // 20%
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.pink[200],
                    child: Text('Recognition'),
                  ),
                )
                // )
              ],
            ),
    );
  }
}
