/*
* Author : LiJiqqi
* Date : 2020/9/23
*/

import 'dart:async';

import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:flutter/material.dart';

class LogoWidget extends WidgetState with SingleTickerProviderStateMixin{

  final List<Widget> list = [];
  Timer timer;
  Image logo;
  @override
  void initState() {
    logo = Image.asset(ImageHelper.wrapAssetsIcon('logo'),width: getWidthPx(150),height: getWidthPx(150),);
    super.initState();

    list.add(logo);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initTimer();
    });
  }

  void initTimer(){
     timer = Timer.periodic(Duration(seconds: 2), (timer) {
       if(mounted){
         ///理论上讲 第二个总是先完成的
         list.add(WaveWidget((index){
           list.removeAt(1);
         }).generateWidget());
         setState(() {

         });
       }else{
         timer.cancel();
       }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidthPx(500),height: getWidthPx(400),
      child: Stack(
        alignment: Alignment.center,
        children: list,
      ),
    );
  }

}

typedef AnimationCallback = void Function(int index);

class WaveWidget extends WidgetState with SingleTickerProviderStateMixin{


  final AnimationCallback animateDone;
  WaveWidget( this.animateDone);

  AnimationController controller;
  Animation first;

  double opacity = 0.8;



  @override
  void initState() {
    controller = AnimationController(duration: Duration(seconds: 3),vsync: this);
    first = Tween<double>(begin: getWidthPx(180),end: getWidthPx(360)).animate(controller);
    super.initState();
//
//    controller.addStatusListener((status) {
//      if(status == AnimationStatus.completed){
//
//      }
//    });
    first.addListener(() {
      opacity = (1-first.value/getWidthPx(360)).clamp(0.0, 1.0);
      setState(() {

      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: first.value,height: first.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(opacity),width: getWidthPx(2))
      ),
    );
  }

}



















