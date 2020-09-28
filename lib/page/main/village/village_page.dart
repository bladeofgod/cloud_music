/*
* Author : LiJiqqi
* Date : 2020/9/17
*/

import 'dart:math';

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
    controller.addListener(() {
      if(controller.index == 1 && villageVM.startList.isEmpty){
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ///当初忘了拆分了，只能这样写了
          Future.delayed(Duration(milliseconds: 100)).then((value)async{
            await villageVM?.scrollController?.requestRefresh()
                ?.whenComplete(() {
              villageVM.scrollController.refreshCompleted();
              setState(() {

              });
            });
          });
        });

      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
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

                          child: TabBarView(
                            controller: controller,
                            children: <Widget>[
                              ///应该拆成两个 文件，忘了拆了，就这样吧。
                              ///广场
                              content(),
                              ///关注
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

    return Container(
      color: Colors.white,
      child: SmartRefresher(
        controller:villageVM.scrollController ,
        enablePullDown: true,
        enablePullUp: false,
        header: MaterialClassicHeader(),
        onRefresh: villageVM.getStar,
        child: CustomScrollView(
          slivers: <Widget>[

            sliverWrapper(Divider(height: getWidthPx(2),color: Color.fromRGBO(238, 238, 238, 1),)),
            ///我的云quan
            myCloud(),
            sliverWrapper(Divider(height: getWidthPx(2),color: Color.fromRGBO(238, 238, 238, 1),)),
            ///box
            myFollow(),
            ///star title
            startTitle(),
            ///list
            startList(),
          ],
        ),
      ),
    );
  }

  Widget startList(){
    return sliverWrapper(Container(
      height: getWidthPx(460),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: villageVM.startList.map((e){
          final int index = villageVM.startList.indexOf(e);
          final int fans = Random().nextInt(10000);
          return Container(
            width: getWidthPx(340),height: getWidthPx(460),
            margin: EdgeInsets.only(left: index ==0 ? getWidthPx(140):0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHeightPx(6)),
                border: Border.all(color: Color.fromRGBO(238, 238, 238, 1),
                    width: getWidthPx(1))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ShowImageUtil.showImageWithDefaultError(e.picUrl + ShowImageUtil.img50, 
                    getWidthPx(180), getWidthPx(180),borderRadius: getWidthPx(90)),
                getSizeBox(height: getWidthPx(10)),
                Text('${e.name}',style: TextStyle(color: Colors.black,fontSize: getSp(28)),),
                Text('$fans 粉丝',style: TextStyle(color: Colors.grey,fontSize: getSp(24)),),
                getSizeBox(height: getWidthPx(20)),
                GestureDetector(
                  onTap: (){
                    //todo
                  },
                  child: Container(
                    width: getWidthPx(140),height: getWidthPx(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getWidthPx(25)),
                      color: Colors.red
                    ),
                    alignment: Alignment.center,
                    child: Text('${e.followed?'已关注':'+ 关注'}',style: TextStyle(
                        color: Colors.white,fontSize: getSp(26)
                    ),),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    ));
  }

  Widget startTitle(){
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
        height: getWidthPx(120),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: getWidthPx(80),height: getWidthPx(80),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,color: Colors.red
              ),
              child: Icon(Icons.person_add,color: Colors.white,size: getWidthPx(60),),
            ),
            getSizeBox(width: getWidthPx(20)),
            Text('你可能感兴趣的人',style: TextStyle(color: Colors.black,fontSize: getSp(30),),),
            Expanded(
              child: const SizedBox(),
            ),
            Text('查看更多',style: TextStyle(color: Colors.grey,fontSize: getSp(30),),),
            getSizeBox(width: getWidthPx(20)),
            Icon(Icons.chevron_right,size: getWidthPx(40),),
          ],
        ),
      ),
    );
  }

  Widget myFollow(){
    return sliverWrapper(Container(

      height: getWidthPx(500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.inbox,size: getWidthPx(200),color: Colors.red,),
          getSizeBox(height: getWidthPx(30)),
          Text('你还没有关注的人哦',style: TextStyle(color: Colors.black,fontSize: getSp(36)),),
          getSizeBox(height: getWidthPx(20)),
          Text('快去多多关注感兴趣的人吧',style: TextStyle(color: Colors.grey,fontSize: getSp(32)),),
        ],
      ),
    ));
  }

  Widget myCloud(){
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
        height: getWidthPx(120),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: getWidthPx(80),height: getWidthPx(80),
              decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.lightBlueAccent
              ),
              child: Icon(Icons.vpn_lock,color: Colors.white,size: getWidthPx(60),),
            ),
            getSizeBox(width: getWidthPx(20)),
            Text('我的云圈',style: TextStyle(color: Colors.grey,fontSize: getSp(30),),),
            Expanded(
              child: const SizedBox(),
            ),
            Icon(Icons.chevron_right,size: getWidthPx(40),),
          ],
        ),
      ),
    );
  }

  Widget content(){
    if(villageVM.busy){
      return Container(

        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      color: Color.fromRGBO(238, 238, 238, 1),
      padding: EdgeInsets.only(left: getWidthPx(30),right: getWidthPx(30),
        bottom: getWidthPx(50)),
      child: SmartRefresher(
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
              })),
    );
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











