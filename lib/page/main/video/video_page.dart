/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/progress_widget.dart';
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/video/detail_page.dart';
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

    super.initState();
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
              if(videoModel.busy){
                return Container(
                  child: Center(child: Common163MusicLoading().generateWidget(),),
                );
              }
              if(controller == null){
                controller = TabController(initialIndex: 0,length: videoPageVM.groupList.length,vsync: this);
              }

              return buildContent();
            },
          );
        },
      ));
  }

  Widget buildContent(){
    return Container(
      width: getWidthPx(750),
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
          final int index = videoPageVM.groupList.indexOf(e);
          return DetailPage(e,index,controller).generateWidget();
        }).toList(),
      ),
    );
  }



  Widget tabBar() {
    return  Container(
      height: getWidthPx(120),//width: getWidthPx(750),
      alignment: Alignment.bottomCenter,
      child: TabBar(
        isScrollable: true,
        controller: controller,
        tabs: videoPageVM.groupList.map<Widget>((e){
          return tabItem(e.name);
        }).toList(),
        indicatorColor: Colors.red,
        //indicatorPadding: EdgeInsets.symmetric(horizontal: getWidthPx(30)),
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
      ),
    );
  }

  Widget tabItem(String title){
    return Text(title,style: TextStyle(
        fontSize: getSp(30),fontWeight: FontWeight.w400),//maxLines: 1,
    );
  }

}










