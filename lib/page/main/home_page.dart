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
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/material.dart';

import 'discovery/vm/tabbar_vm.dart';

class HomePage extends PageState{

  TabBarViewModel tabController;

  PageController pageController;

  static double horPadding ;

  @override
  void initState() {
    horPadding = getWidthPx(30);
    pageController = PageController(initialPage: 1);
    super.initState();
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
              Expanded(child: buildBody()),
            ],
          ),
        ) );
  }

  Widget buildBody(){
    return PageView(
      controller: pageController,
      onPageChanged: (index){
        debugPrint('$index');
        tabController.switchPage(index);
      },
      children: <Widget>[
        MinePage().generateWidget(),
        DiscoveryPage().generateWidget(),
        VillagePage().generateWidget(),
        VideoPage().generateWidget()

      ],
    );
  }

  Widget buildAppBar() {
    return Container(
      //color: Colors.blue,
      width: getWidthPx(750),height: getWidthPx(160),
      padding: EdgeInsets.symmetric(horizontal: horPadding),
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
        //todo
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

}





















