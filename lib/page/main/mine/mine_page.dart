/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/login/login_page.dart';
import 'package:cloud_music/page/main/entity/user_song_entity.dart';
import 'package:cloud_music/page/main/mine/vm/mine_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MinePage extends PageState with AutomaticKeepAliveClientMixin{

  UserViewModel userViewModel;
  MineVM mineVM;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<UserViewModel>(
      builder: (ctx,userModel,child){
        userViewModel = userModel;
        if(mineVM == null){
          mineVM = MineVM(userModel);
          if(mineVM.userDetailEntity == null && userModel.hasUser){
            debugPrint('加载详情');
            mineVM.initData();
          }
        }

        return ProviderWidget<MineVM>(
          model:mineVM ,
          onModelReady: (model){
            //model.initData();
          },
          builder: (ctx,model,child){

            mineVM = model;
            return SingleChildScrollView(
              controller: mineVM.controller,
              child: buildContent(),
            );
          },
        );
      },
    );
  }

  Widget buildContent(){
    return Container(
      color: Colors.white,padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
      child: Column(
        children: <Widget>[
          getSizeBox(height: getWidthPx(80)),
          userWidget(),
          dragonBall(),
          ///喜欢的音乐
          likeMusic(),
          getSizeBox(height: getWidthPx(50)),
          ///歌单zone header
          songListZoneHeader(),

          ///创建
          createZone(),
          getSizeBox(height: getWidthPx(40)),
          ///收藏
          collectZone(),

          getSizeBox(height: getWidthPx(150)),


        ],
      ),
    );
  }


  userWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidthPx(40)),
      height: getWidthPx(120),width: getWidthPx(710),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: mineVM.hasUser()
            ? hasUser() : noUser(),
      ),
    );
  }
  List<Widget> noUser(){
      return <Widget>[
        Icon(Icons.person_pin,color: Colors.pinkAccent,size: getWidthPx(120),),
        Positioned(
          left: getWidthPx(140),
          child: GestureDetector(
            onTap:(){
              push(LoginPage());
            } ,
            child: Container(
              width: getWidthPx(200),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Text('立即登录',style: TextStyle(color: Colors.black,
                    fontSize: getSp(32)),),
                  getSizeBox(width: getWidthPx(20)),
                  Icon(Icons.chevron_right,color: Colors.black,size: getWidthPx(36),),
                ],
              ),
            ),
          ),
        ),
      ];
  }

  List<Widget> hasUser(){
    return <Widget>[
      ///avatar
      ShowImageUtil.showImageWithDefaultError(userViewModel.userAvatar+ShowImageUtil.img50,
          getWidthPx(120), getWidthPx(120),borderRadius: getWidthPx(60)),
      ///user name
      Positioned(
        top: getWidthPx(10),
        left: getWidthPx(140),
        child: Text('${userViewModel.userName}',style: TextStyle(color: Colors.black,
              fontSize: getSp(32)) ,),
      ),

      ///user tag
      Positioned(
        bottom: getWidthPx(10),
        left: getWidthPx(140),
        child: Row(
          children: <Widget>[
            ///vip
            Container(
              width: getWidthPx(100),height: getWidthPx(40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,borderRadius: BorderRadius.circular(getWidthPx(20)),
              ),
              child: Text('VIP开通',style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,fontSize: getSp(24)),),
            ),
            getSizeBox(width: getWidthPx(10)),
            ///lvl
            Container(
              width: getWidthPx(80),height: getWidthPx(40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(238, 238, 238, 1),borderRadius: BorderRadius.circular(getWidthPx(20)),
              ),
              child: Text('Lv.${mineVM.getUserLvl()}',style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,fontSize: getSp(24)),),
            ),


          ],
        ),
      ),
      
      Positioned(
        right: 0,
        child: Icon(Icons.chevron_right,size: getWidthPx(60),color: Colors.black,),
      ),




    ];
  }

  dragonBall() {
    return Container(
      height: getWidthPx(360),
      margin: EdgeInsets.symmetric(horizontal: getWidthPx(20),vertical: getWidthPx(40)),
      padding: EdgeInsets.symmetric(vertical: getWidthPx(30)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getWidthPx(16)),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(238, 238, 238, 1),blurRadius: 5.0)
        ]
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBall(Icons.cloud_download, '本地音乐'),
                buildBall(Icons.cloud_upload, '云盘'),
                buildBall(Icons.check_circle, '已购'),
                buildBall(Icons.play_circle_filled, '最近播放'),
              ],
            ),
          ),
          getSizeBox(height: getWidthPx(30)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBall(Icons.library_music, '我的关注'),
                buildBall(Icons.star, '收藏'),
                buildBall(Icons.radio, '我的电台'),
                buildBall(Icons.add_circle, '音乐应用'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildBall(IconData iconData,String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(iconData,size: getWidthPx(80),color: Colors.red,),
        Text(title,style: TextStyle(color: Colors.grey,fontSize: getSp(26)),)
      ],
    );
  }

  likeMusic() {
    return Container(
      height: getWidthPx(200),
      padding: EdgeInsets.all(getWidthPx(20)),
      margin: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getWidthPx(16)),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(238, 238, 238, 1),blurRadius: 5.0)
          ]
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            width: getWidthPx(130),height: getWidthPx(130),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getWidthPx(16)),
              color: Colors.pinkAccent.withOpacity(0.3),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.favorite,size: getWidthPx(60),color: Colors.red,),
          ),
          Positioned(
            left: getWidthPx(150),
            top: getWidthPx(30),
            child: Text('我喜欢的音乐',style: TextStyle(color: Colors.black,fontSize: getSp(32)),),
          ),
          Positioned(
            left: getWidthPx(150),
            bottom: getWidthPx(30),
            child: Text('${mineVM.likeMusicCount()}首',style: TextStyle(color: Colors.grey,fontSize: getSp(26)),),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: getWidthPx(10)),
              width: getWidthPx(170),height: getWidthPx(60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getWidthPx(30)),
                  border: Border.all(color: Colors.grey,width: getWidthPx(1))
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.favorite_border,color: Colors.black,size: getWidthPx(36),),
                  //getSizeBox(width: getWidthPx(10)),
                  Text('心动模式',style: TextStyle(color: Colors.black,fontSize: getSp(26)),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  songListZoneHeader() {
    return Container(
      height: getWidthPx(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          headerItem('创建歌单',0),
          headerItem('收藏歌单',1),

        ],
      ),
    );
  }
  headerItem(String title,int index){
    return GestureDetector(
      onTap: (){
        mineVM.switchIndex(index);
      },
      child: Container(
        width: getWidthPx(140),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$title',style: TextStyle(color:
            mineVM.selectIndex == index ?Colors.black:Colors.grey,fontSize: getSp(32)),),
            getSizeBox(height: getWidthPx(10)),
            Container(
              height: getWidthPx(6),
                color: mineVM.selectIndex == index
                    ?Colors.red:Colors.transparent
            ),
          ],
        ),
      ),
    );
  }



  createZone() {
    return Container(
      padding: EdgeInsets.all(getWidthPx(20)),
      margin: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getWidthPx(16)),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(238, 238, 238, 1),blurRadius: 5.0)
          ]
      ),
      child: Column(
        children: <Widget>[
          header('创建歌单',Icons.more_vert),
          getSizeBox(height: getWidthPx(20)),
          ///歌单
          ...insertSongList(),
        ],
      ),
    );
  }

  List<Widget> insertSongList(){
    List<Widget> childs = [];
    if(userViewModel.hasUser && mineVM.songList != null){
      mineVM.songList.forEach((element) {
        childs.add(songItemWidget(element));
      });
      childs.add(addSongsWidget());

    }else{
      childs.add(addSongsWidget());

    }
    return childs;
  }

  ///歌单
  Widget songItemWidget(UserSongEntity entity){
    return Container(
      height: getWidthPx(140),width: getWidthPx(670),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            width: getWidthPx(110),height: getWidthPx(110),
            child: ShowImageUtil.showImageWithDefaultError(
            entity.coverImgUrl+ShowImageUtil.img200, getWidthPx(110), getWidthPx(110),
              borderRadius: getWidthPx(20)),
          ),
          ///name
          Positioned(
            left: getWidthPx(130),top: getWidthPx(25),
            child: Text('${entity.name}',style: TextStyle(color: Colors.black,fontSize: getSp(30)),),
          ),
          ///count
          Positioned(
            left: getWidthPx(130),bottom: getWidthPx(25),
            child: Text('${entity.trackCount}首',style: TextStyle(color: Colors.grey,fontSize: getSp(28)),),
          ),

          Positioned(
            right: 0,
            child: Icon(Icons.more_vert,color:Colors.grey ,size: getWidthPx(50),),
          ),



        ],
      ),
    );
  }

  ///导入外部歌单
  Widget addSongsWidget(){
    return Container(
      height: getWidthPx(140),
      child: Row(
        children: <Widget>[
          Container(
            width: getWidthPx(110),height: getWidthPx(110),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getWidthPx(16)),
              color: Color.fromRGBO(230, 230, 230, 0.8),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.transform,size: getWidthPx(60),color: Colors.black,),
          ),
          getSizeBox(width: getWidthPx(20)),
          Text('导入外部歌单',style: TextStyle(color: Colors.black,fontSize: getSp(32)),)
        ],
      ),
    );
  }


  collectZone() {
    return Container(
      padding: EdgeInsets.all(getWidthPx(20)),
      margin: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getWidthPx(16)),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(238, 238, 238, 1),blurRadius: 5.0)
          ]
      ),
      child: Column(
        children: <Widget>[
          header('收藏歌单',Icons.more_vert),
          getSizeBox(height: getWidthPx(20)),
          Container(
            height: getWidthPx(140),
            alignment: Alignment.center,
            child: Text('找不到收藏歌单的接口了',style: TextStyle(
              color: Colors.grey,fontSize: getSp(28)
            ),),
          ),
        ],
      ),
    );
  }

  header(String title,IconData iconData){
    return Container(
      height: getWidthPx(60),
      child: Row(
        children: <Widget>[
          Text(title,style: TextStyle(color: Colors.grey,fontSize: getSp(28)),),
          Expanded(
            child: const SizedBox(),
          ),
          Icon(iconData,size: getWidthPx(36),color: Colors.grey,),
        ],
      ),
    );
  }

}