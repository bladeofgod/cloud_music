/*
* Author : LiJiqqi
* Date : 2020/4/1
*/



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music/base_framework/widget_state/base_state.dart';

import 'package:cloud_music/base_framework/widget_state/base_stateless_widget.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';

class CircleProgressWidget extends BaseStatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(

      width: getWidthPx(150),
      height: getWidthPx(150),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getHeightPx(15)),
        color: Colors.white,
      ),
      child: Container(
        width: getWidthPx(60),
        height: getWidthPx(60),
        child: CircularProgressIndicator(),
      ),
    );
  }

}

///显示progress 方式 1
///这种方式，需要在布局中添加FullPageCircleProgressWidget
class FullPageCircleProgressWidget extends BaseStatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
//      height: getWidthPx(1334),
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      color: Color.fromRGBO(34, 34, 34, 0.3),
      child: CircleProgressWidget(),
    );
  }

}

///显示progress 方式 2
///这种方式，不需要在布局中添加

//typedef LoadingCreate = void Function(DialogLoadingController controller);


class LoadingProgressState extends WidgetState {

  final Widget progress;
  final Color bgColor;
  //final LoadingCreate loadingCreate;
  final DialogLoadingController controller;

  LoadingProgressState({this.progress, this.bgColor, this.controller});


  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if(controller.isShow){
        //todo
      }else{
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
        });
      }
    });
  }

  @override
  void dispose() {
    controller.isShow = false;
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: bgColor??Color.fromRGBO(34, 34, 34, 0.3),
      width: size.width,height: size.height,
      alignment: Alignment.center,
      child:progress?? CircularProgressIndicator(),
    );
  }
}

class DialogLoadingController extends ChangeNotifier{
  bool isShow = true;
  dismissDialog(){
    isShow = false;
    notifyListeners();
  }
}

class Common163MusicLoading extends WidgetState{
  final String text;

  Common163MusicLoading({this.text = '加载中...'});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CloudMusicLoading(Colors.red, getWidthPx(20), getWidthPx(60)).generateWidget(),
          getSizeBox(width: getWidthPx(10)),
          Text(text,style: TextStyle(color: Colors.black,fontSize: getSp(24)),)
        ],
      ),
    );
  }

}


class CloudMusicLoading extends WidgetState {
  
  final Color color;
  final double maxWidth,maxHeight;

  CloudMusicLoading(this.color, this.maxWidth, this.maxHeight);
  
  
  @override
  void initState() {

    super.initState();
  }
  
  @override
  void dispose() {

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: getWidthPx(80),
      height: getWidthPx(60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LoadingItem(color,0.1,1.0,getWidthPx(maxWidth),getWidthPx(maxHeight)).generateWidget(),
          LoadingItem(color,0.4,1.0,getWidthPx(maxWidth),getWidthPx(maxHeight)).generateWidget(),
          LoadingItem(color,0.7,1.0,getWidthPx(maxWidth),getWidthPx(maxHeight)).generateWidget(),
          LoadingItem(color,0.4,1.0,getWidthPx(maxWidth),getWidthPx(maxHeight)).generateWidget(),

        ],
      ),
    );
  }
  wrapper(Widget child){
    return Container();
  }
  
}

class LoadingItem extends WidgetState with SingleTickerProviderStateMixin{

  final Color color;
  final double start,end;
  final double width,height;
  LoadingItem(this.color, this.start, this.end, this.width, this.height);

  AnimationController controller;
  Animation<double> animation;


  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 500),vsync: this);
    animation = Tween<double>(begin: 0.0,end: 1.0).animate(controller);
    controller.value = start;
    super.initState();
    animation.addListener(() {
      setState(() {

      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,width: width,height: (animation.value * height).clamp(0.1,height),
    );
  }

}













