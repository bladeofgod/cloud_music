/*
* Author : LiJiqqi
* Date : 2020/9/18
*/


import 'package:flutter/cupertino.dart';

class TabBarViewModel extends ChangeNotifier{
  int pageIndex = 0;

  final double min ;
  final double max ;

  final AnimationController controller;
  final Animation animation;

  TabBarViewModel(this.pageIndex,this.min,this.max,this.controller,this.animation);

  bool isResetting = false;
  void resetController(){
    isResetting = true;
    controller.reset();
    isResetting = false;
  }

  List<int> indexRecord = [];

  switchPage(int index){
    pageIndex = index;
    record();
    notifyListeners();
    controller.forward();
  }

  double textScaleFactor = 1.3;
  updateFactor(double newV){
    textScaleFactor = newV;
    notifyListeners();
  }

  void record() {
    if(indexRecord.length == 3) indexRecord.removeAt(0);
    indexRecord.add(pageIndex);
  }

  int getLastIndex(){
    return indexRecord.isEmpty?0 :indexRecord.last;
  }
}