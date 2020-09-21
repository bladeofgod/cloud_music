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

  final Duration interval = Duration(seconds: 3);
  Stream clock;
  StreamSubscription streamSubscription;

  MusicCalendarVM(this.block3, this.creatives){
    clock = Stream.periodic(interval,(index){

    });

    streamSubscription = clock.listen((i) async{
      incrementIndex();
    });
    streamSubscription.pause();

  }





  init(){
    if(streamSubscription.isPaused){
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


















