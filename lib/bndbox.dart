import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'models.dart';

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;
  final double cx;
  final double cy;

  BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW,
      this.model, this.cx, this.cy);

  @override
  Widget build(BuildContext context) {
    double distance = screenW + screenH;
    var temp = results.toList();
    for (int i = temp.length - 1; i > -1; i--) {
      var _x = temp[i]["rect"]["x"];
      var _y = temp[i]["rect"]["y"];
      var _w = temp[i]["rect"]["w"];
      var _h = temp[i]["rect"]["h"];
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

      if (cx > x && cx < xi && cy > y && cy < yi) {
        if (distance > w + h) {
          distance = w + h;
          for (int j = temp.length - 1; j > i; j--) {
            temp.removeAt(j);
          }
        }
      }
    }
    List<Widget> _renderBoxes() {
      return temp.map((re) {
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
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

        if (cx > x && cx < xi && cy > y && cy < yi) {
          return Positioned(
            left: math.max(0, x),
            top: math.max(0, y),
            width: w,
            height: h,
            child: Container(
              padding: EdgeInsets.only(top: 5.0, left: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  color: Color.fromRGBO(253, 160, 73, 1.0),
                  width: 1.5,
                ),
              ),
              // child: Text(
              //   "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
              //   style: TextStyle(
              //     color: Color.fromRGBO(253, 160, 73, 1.0),
              //     fontSize: 14.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          );
        } else {
          return Positioned(
            left: math.max(0, x),
            top: math.max(0, y),
            width: w,
            height: h,
            child: Container(
              padding: EdgeInsets.only(top: 5.0, left: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0.1,
                ),
              ),
            ),
          );
        }
      }).toList();
    }

    return Stack(
      children: _renderBoxes(),
    );
  }
}
