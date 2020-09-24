/*
* Author : LiJiqqi
* Date : 2020/9/24
*/

import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerPage extends PageState with SingleTickerProviderStateMixin{
  
  AnimationController controller;
  Animation animation;

  double maxDrawerWidth;
  double flag;
  double startPos;
  
  @override
  void initState() {
    maxDrawerWidth = getWidthPx(650);
    startPos = -getWidthPx(650);
    flag = startPos/3;
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: startPos,end: 0).animate(controller);
    super.initState();
    animation.addListener(() {
      startPos = animation.value;
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
    return Material(
      color: Colors.transparent,
      child: Consumer<UserViewModel>(
        builder: (ctx,userModel,child){
          return GestureDetector(
            onTap: (){
              //todo
              closeDrawer(0.0);
            },
            child: Container(
              color: Color.fromRGBO(34, 34, 34, 0.3),
              width: getWidthPx(750),height: getHeightPx(1334),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: startPos,
                    child: drawer(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  Widget drawer(){
    return GestureDetector(
      onHorizontalDragStart: dragStart,
      onHorizontalDragUpdate: dragUpdate,
      onHorizontalDragEnd: dragEnd,
      child: Container(
        color: Colors.white,
        width: getWidthPx(650),height: getHeightPx(1334),
        child: SingleChildScrollView(),
      ),
    );
    
  }

  Offset startPoint;
  Offset lastPoint;
  dragStart(DragStartDetails details){
    startPoint = details.globalPosition;

  }

  dragUpdate(DragUpdateDetails details){
    final Offset delta = details.delta;
    if(delta.dx < 0){
      setState(() {
        startPos += delta.dx;
      });
    }
    lastPoint = details.globalPosition;
  }

  dragEnd(DragEndDetails details){
    debugPrint('$startPos  -----$flag');
    if(startPos < flag){
      closeDrawer(startPos);
    }else{
      reOpenDrawer(startPos);

    }

  }

  closeDrawer(double start){
    double time = (maxDrawerWidth-(start.abs()))/maxDrawerWidth;
    controller.reverse(from: time)
      .whenComplete((){
        pop();
    });
  }

  reOpenDrawer(double start){
    controller.reset();
    double time = (maxDrawerWidth-(start.abs()))/maxDrawerWidth;
    controller.forward(from: time);
  }


}






















