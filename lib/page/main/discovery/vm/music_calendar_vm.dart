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

  MusicCalendarVM(this.block3, this.creatives){
    clock = Stream.periodic(interval,(index){

    });

    streamSubscription = clock.listen((i) async{
      if(destroy)return;
      debugPrint('${fadeController.status}');
      if(fadeController.status == AnimationStatus.completed|| fadeController.status == AnimationStatus.dismissed){
        fadeController.forward().whenComplete((){
          incrementIndex();
          fadeController.reverse();
        });
      }


    });
    streamSubscription.pause();

  }

  animationListener(){

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


















