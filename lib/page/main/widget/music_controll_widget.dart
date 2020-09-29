/*
* Author : LiJiqqi
* Date : 2020/9/29
*/



import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/material.dart';


class MusicControllWidget extends WidgetState{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: getWidthPx(1),
            color: Color.fromRGBO(238, 238, 238, 1))),
      ),
      width: getWidthPx(750),height: HomePage.bottomPadding,
      //alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Icon(Icons.music_note,size: getWidthPx(100),color: Colors.red,),
          Positioned(
            top: getWidthPx(10),
            left: getWidthPx(110),
            child: Text('music name',style: TextStyle(color: Colors.black,fontSize: getSp(32)),),
          ),
          Positioned(
            bottom: getWidthPx(10),
            left: getWidthPx(110),
            child: Text('横滑可以切换上下首哦',style: TextStyle(color: Colors.grey,fontSize: getSp(26)),),
          ),
          ///play
          Positioned(
            right: getWidthPx(100),
            child: Icon(Icons.play_circle_outline,size: getWidthPx(90),color: Colors.black,),
          ),
          ///list
          Positioned(
            right: 0,
            child: Icon(Icons.playlist_play,color: Colors.black,size: getWidthPx(90),),
          ),
        ],
      ),
    );
  }

}