/*
* Author : LiJiqqi
* Date : 2020/9/21
*/

import 'dart:async';

import 'package:cloud_music/page/main/entity/blocks/block_3.dart';
import 'package:flutter/cupertino.dart';

class MusicCalendarVM extends ChangeNotifier{

  final Block3 block3;
  final List<Creatives> creatives;

  AnimationController fadeController;
  Animation fadeAnim;

  final Duration interval = Duration(seconds: 5);
  Stream clock;
  StreamSubscription streamSubscription;

  bool destroy = false;

  double aboveRightMax;
  double aboveBottomMax;

  double opacity = 0.0;

  MusicCalendarVM(this.block3, this.creatives,){
    clock = Stream.periodic(interval,(index){

    });

    streamSubscription = clock.listen((i) async{
      if(destroy)return;
      debugPrint('${fadeController.status}');
      if(fadeController.status == AnimationStatus.completed|| fadeController.status == AnimationStatus.dismissed){
        ///title和 above 渐隐，同时fake上移
        fadeController.forward().whenComplete((){
          right = aboveRightMax;
          bottom = aboveBottomMax;
          notifyListeners();
          ///更新index
          incrementIndex();
          ///插入新的below
          showBelow();
          //fadeController.reverse();
        });
      }


    });
    streamSubscription.pause();

  }

  void showBelow(){
    Timer timer = Timer.periodic(Duration(milliseconds: 20), (timer){
      if(opacity >= 1.0){
        timer.cancel();
        ///渐显above和title
        fadeController.reverse().whenComplete((){
          ///隐藏fake
          showFake = false; notifyListeners();
          ///重置fake位置,显示fake
          right = 0; bottom = 0;
          fakeIndex = currentIndex <= creatives.length-2 ? currentIndex+1:0;
          showFake = true;
          opacity = 0;
          notifyListeners();
        });
        return;
      }
      opacity =(opacity+0.1) > 1 ? 1.0 : (opacity+0.1);
      notifyListeners();
    });

  }

  double right = 0;
  double bottom = 0;
  void updatePosition(){
    right = aboveRightMax * (1-fadeAnim.value);
    bottom = aboveBottomMax * (1-fadeAnim.value);
    notifyListeners();
  }

  animationListener(){
    if(fadeController.status == AnimationStatus.forward){
      if(!showFake) showFake = true;
      updatePosition();
    }

  }

  animStatusListener(AnimationStatus status){

  }





  init(){
    debugPrint('init');
    if(streamSubscription.isPaused){
      debugPrint('init');
      streamSubscription.resume();
    }
  }

  bool showFake = true;
  int fakeIndex = 1;

  int currentIndex = 0;
  incrementIndex(){
    if(currentIndex == creatives.length-1){
      currentIndex = 0;
    }else{
      currentIndex++;
    }
    notifyListeners();
  }

}


















