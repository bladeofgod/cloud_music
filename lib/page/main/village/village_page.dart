/*
* Author : LiJiqqi
* Date : 2020/9/17
*/

import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:cloud_music/page/main/village/vm/village_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class VillagePage extends PageState with AutomaticKeepAliveClientMixin,
  SingleTickerProviderStateMixin{

  VillageVM villageVM;

  int currentIndex = 0;
  TabController controller;
  @override
  void initState() {
    controller = TabController(initialIndex: 0,length: 2,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(child:
        Consumer<UserViewModel>(
          builder: (ctx,userModel,child){
            return ProviderWidget<VillageVM>(
              model: VillageVM(),
              onModelReady: (model){
                model.initData();

              },
              builder: (ctx,model,child){

                villageVM = model;
                return Container(
                  padding: EdgeInsets.only(
                    bottom: HomePage.bottomPadding),
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: getWidthPx(120),
                        alignment: Alignment.bottomCenter,
                        child: TabBar(
                          controller: controller,
                          tabs: <Widget>[
                            tabItem('广场', 0),
                            tabItem('关注', 1),
                          ],
                          indicatorColor: Colors.red,
                          indicatorPadding: EdgeInsets.symmetric(horizontal: getWidthPx(150)),
                          labelColor: Colors.red,
                          unselectedLabelColor: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Color.fromRGBO(238, 238, 238, 1),
                          padding: EdgeInsets.only(left: getWidthPx(30),right: getWidthPx(30)),
                          child: TabBarView(
                            controller: controller,
                            children: <Widget>[
                              content(),
                              follow(),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }

  Widget tabItem(String title,int index){
    return Text(title,style: TextStyle(
        //color: index == currentIndex ? Colors.red
         // :Colors.black,
        fontSize: getSp(32)),);
  }

  Widget follow(){
    if(villageVM.busy){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container();
  }

  Widget content(){
    if(villageVM.busy){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SmartRefresher(
        controller:villageVM.refreshController ,
        enablePullDown: true,
        enablePullUp: false,
        header: MaterialClassicHeader(),
    onRefresh: villageVM.initData,
      child: GridView.builder(
        itemCount: villageVM.list.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,mainAxisSpacing: getWidthPx(20),crossAxisSpacing: getWidthPx(10),
      childAspectRatio: 0.5
    ),
    itemBuilder: (ctx,index){
          return buildItem(index);
    }));
  }

  Widget buildItem(int index) {
    final entity = villageVM.list[index];
    return Container(
      margin: EdgeInsets.only(top: (index==0||index==1)?getWidthPx(20):0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getHeightPx(20)),
      ),
      child: Column(
        children: <Widget>[

          ///image
          ShowImageUtil.showImageWithDefaultError(entity.simpleResourceInfo.songCoverUrl+ShowImageUtil.img400V,
              getWidthPx(340), getWidthPx(480),borderStyle: BorderRadius.only(topRight: Radius.circular(getHeightPx(20)),
                topLeft: Radius.circular(getHeightPx(20))),boxFit: BoxFit.fill),
          getSizeBox(height: getWidthPx(16)),
          ///title
          Text('${entity.content}',style: TextStyle(color: Colors.black,fontSize: getSp(28)),
            maxLines: 2,overflow: TextOverflow.ellipsis,),
          getSizeBox(height: getWidthPx(15)),
          ///user
          Container(
            margin: EdgeInsets.symmetric(horizontal: getWidthPx(10)),
            child: Row(
              children: <Widget>[
                ShowImageUtil.showImageWithDefaultError(entity.simpleUserInfo.avatar+ShowImageUtil.img50,
                    getWidthPx(60), getWidthPx(60),borderRadius: getWidthPx(30)),
                getSizeBox(width: getWidthPx(10)),
                SizedBox(
                  width: getWidthPx(110),
                  child: Text('${entity.simpleUserInfo.nickname}',style: TextStyle(fontSize: getSp(24),
                      color: Colors.grey),maxLines: 1,),
                ),
                Expanded(
                  child: const SizedBox(),
                ),

                Text('${villageVM.getLikeCount(entity.likedCount)}赞',style: TextStyle(fontSize: getSp(24),
                    color: Colors.grey),),
                getSizeBox(width: getWidthPx(8)),
                GestureDetector(
                  onTap: (){
                    //todo
                  },
                  child: Icon(Icons.more_vert,color: Colors.grey,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



}











