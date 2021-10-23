import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera.dart';
import 'bndbox.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";
  String title = "None detection";
  double sx = 0;
  double sy = 0;

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String? res;
    _model = ssd;
    switch (_model) {
      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    print(res);
  }

  onSelect() {
    setState(() {
      _model = ssd;
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
    int _selectedIndex = 0;
    Size screen = MediaQuery.of(context).size;
    loadModel();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: new Text(this.title,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 35.0)),
        backgroundColor: Color(0x44000000),
        elevation: 1,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0x44000000),
        elevation: 1,
        selectedItemColor: Colors.amber[800],

        // onTap: _onItemTapped,
      ),
      body: _model == "ssd"
          ? Center()
          : Stack(
              children: [
                // Camera(
                //   widget.cameras,
                //   _model,
                //   setRecognitions,
                // ),
                GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    var cx = details.globalPosition.dx;
                    var cy = details.globalPosition.dy;
                    // or user the local position method to get the offset
                    int previewH = math.max(_imageHeight, _imageWidth);
                    int previewW = math.min(_imageHeight, _imageWidth);
                    double screenH = screen.height;
                    double screenW = screen.width;

                    String result = "None detection";
                    double distance = screenW + screenH;
                    for (int i = 0; i < _recognitions!.length; i++) {
                      var _x = _recognitions![i]["rect"]["x"];
                      var _y = _recognitions![i]["rect"]["y"];
                      var _w = _recognitions![i]["rect"]["w"];
                      var _h = _recognitions![i]["rect"]["h"];
                      var scaleW, scaleH, x, y, w, h;
                      if (screenH / screenW > previewH / previewW) {
                        scaleW = screenH / previewH * previewW;
                        scaleH = screenH;
                        var difW = (scaleW - screenW) / scaleW;
                        x = (_x - difW / 2) * scaleW;
                        w = _w * scaleW;
                        if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
                        y = _y * scaleH;
                        h = _h * scaleH;
                      } else {
                        scaleH = screenW / previewW * previewH;
                        scaleW = screenW;
                        var difH = (scaleH - screenH) / scaleH;
                        x = _x * scaleW;
                        w = _w * scaleW;
                        y = (_y - difH / 2) * scaleH;
                        h = _h * scaleH;
                        if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
                      }
                      var xi = x + w;
                      var yi = y + h;
                      // print(x.toString() +
                      //     ',' +
                      //     y.toString() +
                      //     ',' +
                      //     xi.toString() +
                      //     ',' +
                      //     yi.toString());
                      if (cx.toDouble() > x &&
                          cx.toDouble() < xi &&
                          cy.toDouble() > y &&
                          cy.toDouble() < yi) {
                        if (distance > w + h) {
                          distance = w + h;
                          result = _recognitions![i]["detectedClass"];
                        }
                      }
                    }
                    setState(() {
                      title = result;
                      sx = cx.toDouble();
                      sy = cy.toDouble();
                    });
                    // print(x.toString() + ", " + y.toString());
                  },
                  child: BndBox(
                    _recognitions == null ? [] : _recognitions!,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model,
                    sx,
                    sy,
                  ),
                ),
              ],
            ),
    );
  }
}
