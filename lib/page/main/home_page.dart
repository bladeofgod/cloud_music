/*
* Author : LiJiqqi
* Date : 2020/9/15
*/

import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/discovery/discovery_page.dart';
import 'package:cloud_music/page/main/discovery/widget/custom_tab_bar.dart';
import 'package:cloud_music/page/main/drawer/drawer_page.dart';
import 'package:cloud_music/page/main/mine/mine_page.dart';
import 'package:cloud_music/page/main/video/video_page.dart';
import 'package:cloud_music/page/main/village/village_page.dart';
import 'package:cloud_music/page/main/widget/music_controll_widget.dart';
import 'package:cloud_music/page/search/search_page.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/material.dart';

import 'discovery/vm/tabbar_vm.dart';

class HomePage extends PageState{

  TabBarViewModel tabController;

  PageController pageController;

  int pageIndex = 1;

  static double horPadding ;
  static double bottomPadding;

  @override
  void initState() {
    horPadding = getWidthPx(30);
    bottomPadding = getWidthPx(120);
    pageController = PageController(initialPage: 1);
    super.initState();
    pageController.addListener(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
        child:Container(
          width: getWidthPx(750),height: getHeightPx(1334),
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              buildAppBar(),
              Expanded(child: Stack(
                children: <Widget>[
                  buildBody(),
                  Positioned(
                    bottom: 0,
                    child: MusicControlWidget().generateWidget(),
                  ),
                ],
              )),
            ],
          ),
        ) );
  }

  Widget buildBody(){
    return PageView(
      controller: pageController,
      onPageChanged: (index){
        tabController.switchPage(index);
        pageIndex = index;
      },
      children: <Widget>[
        wrapWithNotify(MinePage().generateWidget()),
        wrapWithNotify(DiscoveryPage().generateWidget()),
        wrapWithNotify(VillagePage().generateWidget()),
        wrapWithNotify(VideoPage().generateWidget())

      ],
    );
  }

  Widget buildAppBar() {
    return Container(
      //color: Colors.blue,
      width: getWidthPx(750),height: getWidthPx(180),
      padding: EdgeInsets.only(left: horPadding,right: horPadding,
        bottom: getWidthPx(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          mineWidget(),
          getSizeBox(width: getWidthPx(40)),
          Expanded(
            child: buildTab(),
          ),
          getSizeBox(width: getWidthPx(40)),
          searchWidget(),
        ],
      ),
    );
  }

  Widget mineWidget() {
    return GestureDetector(
      onTap: (){
        //todo
        push(DrawerPage());
      },
      child: Container(
        width: getWidthPx(80),height: getWidthPx(80),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Icon(Icons.reorder,color: Colors.black,size: getWidthPx(60),),
            ),
            Positioned(
              right: 0,
              top: getWidthPx(20),
              child: msgTip(),
            ),
          ],
        ),
      ),
    );
  }

  Widget msgTip() {
    return Container(
      width: getWidthPx(45),height: getWidthPx(25),
      decoration: BoxDecoration(
        color: Colors.red,borderRadius: BorderRadius.circular(getHeightPx(10))
      ),
      alignment: Alignment.bottomCenter,
      child: Text('45',style: TextStyle(color: Colors.white,fontSize: getSp(18)),),
    );
  }

  Widget searchWidget() {
    return GestureDetector(
      onTap: (){
        push(SearchPage());
      },
      child: Container(
        color: Colors.white,
        width: getWidthPx(60),height: getWidthPx(60),
        child: Icon(Icons.search,color: Colors.black,size: getWidthPx(60),),
      ),
    );
  }

  buildTab() {
    return Container(
      height: getWidthPx(80),
      //color: Colors.greenAccent,
      child: CustomTabBar((controller){
        tabController = controller;
      },(index){
        //tab click
        pageController.jumpToPage(index);
      }).generateWidget(),
    );
  }

  Widget wrapWithNotify(Widget child){
    return NotificationListener<ScrollNotification>(
      child: child,
      onNotification: handleNotification,
    );
  }

  double lastPixels;
  bool handleNotification(ScrollNotification notification){
    final ScrollMetrics metrics = notification.metrics;
    final ScrollPosition pos = pageController.position;
    log('above ${metrics.extentBefore}');
    log('below ${metrics.extentAfter}');
    log('inside ${metrics.extentInside}');
    if(metrics.axis == Axis.horizontal){
      if(lastPixels != null){
        if(metrics.atEdge ){
          log('min ${metrics.minScrollExtent} --- max ${metrics.maxScrollExtent}');
          final double dis = metrics.pixels - lastPixels;
          log('juuuuu   ${((pageIndex+1)*pos.viewportDimension)+dis}');
          if(dis <0){
            //to left
            log('to left');
          }else if(dis > 0){
            //to right
            log('to right');
          }
          debugPrint('jump to  $dis');
          //pageController.jumpTo(((pageIndex+1)*pos.viewportDimension)+dis);
          //lastPixels = metrics.pixels;
        }else{
          lastPixels = metrics.pixels;
        }

      }else{
        lastPixels = metrics.pixels;
      }
    }
//    log('${metrics.pixels}');
//    log('${metrics.axisDirection}');
//    log('${metrics.atEdge}');

    return true;

  }

  void log(String info){
    debugPrint('notification----$info');
  }

}





















