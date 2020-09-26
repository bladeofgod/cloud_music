/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/video/vm/video_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';


class VideoPage extends PageState with AutomaticKeepAliveClientMixin,
  SingleTickerProviderStateMixin{

  UserViewModel userViewModel;
  final VideoPageVM videoPageVM = VideoPageVM();

  TabController controller;
  @override
  void initState() {
    controller = TabController(initialIndex: 0,length: videoPageVM.groupList.length,vsync: this);
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(child:
      Consumer<UserViewModel>(
        builder: (ctx, userModel,child){
          return ProviderWidget<VideoPageVM>(
            model: videoPageVM,
            onModelReady: (model){
              model.initData();
            },
            builder: (ctx,videoModel,child){

              return buildContent();
            },
          );
        },
      ));
  }

  Widget buildContent(){
    return Container(
      padding: EdgeInsets.only(bottom: HomePage.bottomPadding),
      child: Column(
        children: [
          tabBar(),
          Expanded(
            child: body(),
          ),
        ],
      ),
    );
  }

  Widget body(){
    return Container(
      child: TabBarView(
        controller: controller,
        children: videoPageVM.groupList.map((e){
          return ;
        }).toList(),
      ),
    );
  }



  Widget tabBar() {
    return  Container(
      color: Colors.white,
      height: getWidthPx(120),
      alignment: Alignment.bottomCenter,
      child: TabBar(
        controller: controller,
        tabs: videoPageVM.groupList.map((e){
          return tabItem(e.name);
        }).toList(),
        indicatorColor: Colors.red,
        indicatorPadding: EdgeInsets.symmetric(horizontal: getWidthPx(150)),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
      ),
    );
  }

  Widget tabItem(String title){
    return Text(title,style: TextStyle(
      //color: index == currentIndex ? Colors.red
      // :Colors.black,
        fontSize: getSp(32)),);
  }

}










