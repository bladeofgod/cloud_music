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
    debugPrint('progress ---- ${musicController.progress}');
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

  ControlBtnPainter(this.progress,this.borderWidth);


  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = borderWidth;
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;
    debugPrint('size - $size');
    Rect rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2),radius: size.width/2);
    final redRadius = 2*pi * progress;
    debugPrint('progress :$progress   angle : $redRadius');
    canvas.drawArc(rect, 0.0, redRadius, false, paint);
    paint.color = Colors.black;
    canvas.drawArc(rect, redRadius, 2*pi, false, paint);

  }

  @override
  bool shouldRepaint(ControlBtnPainter oldDelegate) {
    return  oldDelegate.progress != progress;
  }

}




