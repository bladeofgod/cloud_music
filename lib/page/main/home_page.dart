/*
* Author : LiJiqqi
* Date : 2020/9/15
*/

import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/material.dart';

class HomePage extends PageState{


  double horPadding ;

  @override
  void initState() {
    horPadding = getWidthPx(20);
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
            ],
          ),
        ) );
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
              top: getWidthPx(12),
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
      color: Colors.white,
    );
  }

}





















