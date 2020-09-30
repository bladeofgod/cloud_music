/*
* Author : LiJiqqi
* Date : 2020/9/30
*/

import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/vm/music_controll_vm.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class ControlBarBtn extends WidgetState{

  final double size;
  final double borderSize;
  final double iconSize;

  ControlBarBtn(this.size,this.borderSize,this.iconSize);



  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: size,height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child:CustomPaint(
            size: Size(size,size),
            painter: ControlBtnPainter(musicController.progress,borderSize),
          ),
        ),
        Icon(
          musicController.musicState == MusicControlState.Playing ?
          Icons.pause
              :
          Icons.play_arrow,
          size:iconSize,color: musicController.musicState == MusicControlState.Playing
            ? Colors.red : Colors.black,
        ),
      ],
    );

  }

}

class ControlBtnPainter extends CustomPainter{

  double progress = 0.0;
  final double borderWidth;

  final Paint p = Paint();
  final Paint blackPaint = Paint();

  ControlBtnPainter(this.progress,this.borderWidth){

    p.strokeWidth = borderWidth;
    p.isAntiAlias = true;
    p.style = PaintingStyle.stroke;
  }

  final double pi2 = pi*2;
  final double halfPi = pi/2;

  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2),radius: size.width/2);
    p.color = Colors.black;
    canvas.drawArc(rect, 0.0, 2*pi, false, p);
    final redRadius = 2*pi * progress;
    p.color = Colors.red;
    canvas.drawArc(rect, 3*halfPi, redRadius, false, p);


  }

  @override
  bool shouldRepaint(ControlBtnPainter oldDelegate) {
    return  oldDelegate.progress != progress;
  }

}




