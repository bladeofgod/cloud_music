/*
* Author : LiJiqqi
* Date : 2020/9/21
*/


import 'dart:async';

import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/discovery/vm/music_calendar_vm.dart';
import 'package:cloud_music/page/main/entity/blocks/block_3.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../discovery_vm.dart';


class MusicCalendar extends WidgetState with SingleTickerProviderStateMixin{

  //DiscoveryViewModel fatherVM;
  final Block3 block3;
  final List<Creatives> creatives;

  final MusicCalendarVM musicCalendarVM;

  MusicCalendar(this.block3):creatives = block3.creatives,
      musicCalendarVM = MusicCalendarVM(block3, block3.creatives);



  AnimationController fadeController;
  Animation fadeAnim;



  @override
  void initState() {
    //fatherVM = Provider.of<DiscoveryViewModel>(context,listen: false);
    super.initState();
    fadeController = AnimationController(vsync: this,duration: Duration(seconds: 100));
    fadeAnim = Tween(begin: 0.0,end: 1.0).animate(fadeController);
  }
  @override
  void dispose() {
    fadeController.dispose();
    musicCalendarVM?.streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MusicCalendarVM>(
      model: musicCalendarVM,
      onModelReady: (model){
        musicCalendarVM.init();
      },
      builder: (ctx,model,child){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
          padding: EdgeInsets.symmetric(vertical: getWidthPx(10),horizontal: getWidthPx(16)),
          width: getWidthPx(750)-HomePage.horPadding,
          height: getWidthPx(270),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: getWidthPx(0.5)),
            borderRadius: BorderRadius.circular(getHeightPx(16)),
            color:Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),blurRadius: getHeightPx(8.0)
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              ///title
              title(),
              ///
              Expanded(
                child: content(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget content(){
    return Container(
      child: Stack(
        children: <Widget>[
          ///date
          Positioned(
            top: getWidthPx(10),
            child: Text('后天',style: TextStyle(fontSize: getSp(28),color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          
          Positioned(
            top: getWidthPx(60),
            child: Container(
              width: getWidthPx(430),
              child: Text('${creatives[musicCalendarVM.currentIndex].uiElement.mainTitle.title}',
                style: TextStyle(color: Colors.grey,fontSize: getSp(32)),maxLines: 2,),
            ),
          ),

          Positioned(
            top: getWidthPx(30),
            right: 0,
            child: imageSwitcher(),
          ),

        ],
      ),
    );
  }

  Widget imageSwitcher(){
    return Container(
      width: getWidthPx(150),height: getWidthPx(150),
      child: Stack(
        children: <Widget>[
          ///below
          Positioned(
            right: 0,
            bottom: 0,
            child: ShowImageUtil.showImageWithDefaultError(creatives[musicCalendarVM.currentIndex<creatives.length-2
                ?musicCalendarVM.currentIndex+1 : 0].uiElement.image.imageUrl
                , getWidthPx(130), getWidthPx(130),borderRadius: getHeightPx(10)),
          ),
          ///above
          Positioned(
            top: 0,
            left: 0,
            child: ShowImageUtil.showImageWithDefaultError(creatives[musicCalendarVM.currentIndex].uiElement.image.imageUrl
                , getWidthPx(130), getWidthPx(130),borderRadius: getHeightPx(10)),
          ),


        ],
      ),
    );
  }

  Widget title() {
    return Container(
      height: getWidthPx(50),
      child: Row(
        children: <Widget>[
          Icon(Icons.library_music,color: Colors.redAccent,size: getWidthPx(40),),
          getSizeBox(width: getWidthPx(10)),
          Text('音乐日历',style: TextStyle(color: Colors.redAccent,fontSize: getSp(32),fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

}












