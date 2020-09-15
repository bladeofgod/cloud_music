/*
* Author : LiJiqqi
* Date : 2020/9/15
*/



import 'dart:async';

import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/widget_state/base_state.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends PageState{

  int count = 3;

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(child: Container(
      width: getWidthPx(750),height: getHeightPx(1334),
      child: Stack(
        children: <Widget>[
          Image.asset(ImageHelper.wrapAssetsBG('bg_splash'),fit: BoxFit.fill,width: getWidthPx(750),height: getHeightPx(1334),),
          Positioned(
            right: getWidthPx(50),top: getHeightPx(100),
            child: buildTimer(),
          ),
        ],
      ),
    ));
  }

  Widget buildTimer() {
    return Container(
      alignment: Alignment.center,
      width: getWidthPx(100),height: getWidthPx(50),
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 0.3),
        borderRadius: BorderRadius.circular(getHeightPx(20))
      ),
      child: Text('$count',style: TextStyle(color: Colors.black,fontSize: getSp(30)),),
    );
  }

  void initTimer() {
    final timer = Timer.periodic(Duration(seconds: 1), (timer) {
      debugPrint('timer ${timer.tick}');
      if(timer.tick > 4) return;
      setState(() {
        count = 4-timer.tick;
      });

      if(count == 0){
        timer.cancel();
        pushReplacement(HomePage());
      }

    });
  }


}