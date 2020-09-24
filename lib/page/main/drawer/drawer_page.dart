/*
* Author : LiJiqqi
* Date : 2020/9/24
*/

import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/login/login_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DrawerPage extends PageState with SingleTickerProviderStateMixin{

  UserViewModel userViewModel;

  AnimationController controller;
  Animation animation;

  double maxDrawerWidth;
  double flag;
  double startPos;

  ScrollController scrollController;

  @override
  void initState() {
    maxDrawerWidth = getWidthPx(650);
    startPos = -getWidthPx(650);
    flag = startPos/3;
    scrollController = ScrollController();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    animation = Tween<double>(begin: startPos,end: 0).animate(controller);
    super.initState();
    animation.addListener(() {
      startPos = animation.value;
      setState(() {

      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Consumer<UserViewModel>(
        builder: (ctx,userModel,child){
          userViewModel = userModel;
          return GestureDetector(
            onHorizontalDragStart: dragStart,
            onHorizontalDragUpdate: dragUpdate,
            onHorizontalDragEnd: dragEnd,
            onVerticalDragStart: dragStartV,
            onVerticalDragUpdate: dragUpdateV,
            onVerticalDragEnd: dragEndV,
            onTap: (){
              //todo
              closeDrawer(0.0);
            },
            child: Container(
              color: Color.fromRGBO(34, 34, 34, 0.3),
              width: getWidthPx(750),height: getHeightPx(1334),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: startPos,
                    child: drawer(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  Widget drawer(){
    return Container(
      width: getWidthPx(650),height: getHeightPx(1334),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              children: <Widget>[
                ///vip
                vipWidget(),
                ///zone
                zoneWidget(),

              ],
            ),
          ),
          ///bottom outer
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: getWidthPx(30)),
              width: getWidthPx(650),height: getWidthPx(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  outerLittle(Icons.brightness_2, '夜间模式'),
                  GestureDetector(
                    onTap: (){
                      userViewModel.userLogout();
                      push(LoginPage());
                    },
                    child: outerLittle(Icons.settings, '切换账号'),
                  ),
                  GestureDetector(
                    onTap: (){
                      SystemNavigator.pop();
                    },
                    child: outerLittle(Icons.power_settings_new, '退出'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    
  }

  Widget outerLittle(IconData icon,String title){
    return Container(
      child: Row(
        children: <Widget>[
          Icon(icon,size: getWidthPx(36),color: Colors.black,),
          getSizeBox(width: getWidthPx(20)),
          Text(title,style: TextStyle(color: Colors.black,fontSize: getSp(30)),)
        ],
      ),
    );
  }

  Widget vipWidget(){
    return Container(
      width: maxDrawerWidth,
      height: getWidthPx(500),
      color: Color.fromRGBO(105, 105, 105, 1),
      child: Container(
        margin: EdgeInsets.only(top: getWidthPx(110),
          left: getWidthPx(30),right: getWidthPx(30)),
        decoration: BoxDecoration(
          color: Color.fromRGBO(105, 105, 105, 1),
          borderRadius: BorderRadius.circular(getHeightPx(16)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(34, 34, 34, 0.5),blurRadius: getHeightPx(8.0)
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            upperWidget(),
            belowWidget(),
          ],
        ),
      ),
    );

  }
  Color vip = Color.fromRGBO(255, 228, 255, 1);
  Widget upperWidget(){
    return Container(
      padding: EdgeInsets.all(getWidthPx(30)),
      height: getWidthPx(170),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Text('开通黑椒VIP',style: TextStyle(color: vip,fontSize: getSp(38)),),
          ),
          Positioned(
            left: 0,
            bottom: getWidthPx(10),
            child: Text('加入黑椒vip，专享两头辣',style: TextStyle(color: Colors.grey,fontSize: getSp(26)),),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: getWidthPx(130),
              //height: getWidthPx(50),
              padding: EdgeInsets.all(getWidthPx(5)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: vip,borderRadius: BorderRadius.circular(getHeightPx(20))
              ),
              child: Text('会员中心',style: TextStyle(color: Colors.black,fontSize: getSp(26)),),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget belowWidget(){
    return Expanded(
      child: Container(
        color: Color.fromRGBO(115, 115, 115, 0.5),
        padding: EdgeInsets.all(getWidthPx(30)),
        alignment: Alignment.topLeft,
        child: Column(

          children: <Widget>[
            Text('加入黑椒vip仅5元，专享两头辣',style: TextStyle(color: vip,fontSize: getSp(26)),),
            Text('体验HiFi音效，感受最high氛围',style: TextStyle(color: Colors.grey,fontSize: getSp(26)),),
          ],
        ),

      ),
    );
  }

  Widget zoneWidget(){
    return Container(
      margin: EdgeInsets.only(top: getWidthPx(400)),
      width: maxDrawerWidth,//height: getHeightPx(1400),
      padding: EdgeInsets.all(getWidthPx(30)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(getHeightPx(30)),
            topRight: Radius.circular(getHeightPx(30)))
      ),
      child: Column(
        children: <Widget>[
          userWidget(),
          getSizeBox(height: getWidthPx(40)),
          Divider(height: getWidthPx(1),color: Color.fromRGBO(238, 238, 238, 1),),
          getSizeBox(height: getWidthPx(40)),
          functionWidget(),
          getSizeBox(height: getWidthPx(120))
        ],
      ),
    );

  }

  Widget userWidget(){
    return userViewModel.hasUser ? hasUser() : noUser();
  }

  Widget hasUser(){
    return Container(
      height: getWidthPx(240),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,left: 0,
            child: ShowImageUtil.showImageWithDefaultError(userViewModel.userAvatar+ShowImageUtil.img50,
                getWidthPx(80), getWidthPx(80),borderRadius: getWidthPx(40)),
          ),
          Positioned(
            top: getWidthPx(20),left: getWidthPx(100),
            child: Text('${userViewModel.userName}',style: TextStyle(color: Colors.black,fontSize: getSp(30)),),
          ),
          Positioned(
            right: 0,top: 0,
            child: Container(
              width: getWidthPx(100),height: getWidthPx(60),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,borderRadius: BorderRadius.circular(getWidthPx(30))
              ),
              //padding: EdgeInsets.all(getHeightPx(20)),
              child: Text('签到',style: TextStyle(color: Colors.white,fontSize: getSp(24)),),
            ),
          ),
          Positioned(
            bottom: 0,left: 0,
            child: userCenter(),
          ),
        ],
      ),
    );
  }
  Widget userCenter(){
    return Container(
      width: maxDrawerWidth - getWidthPx(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildLittle(Icons.mail_outline, '我的信息'),
          buildLittle(Icons.people, '我的好友'),
          buildLittle(Icons.home, '个人主页'),
          buildLittle(Icons.voicemail, '个性装扮'),
        ],
      ),
    );
  }
  Widget buildLittle(IconData icon,String title){
    return Container(
      width: getWidthPx(110),
      child: Column(
        children: <Widget>[
          Icon(icon,size: getWidthPx(60),color: Colors.red,),
          getSizeBox(height: getWidthPx(10)),
          Text(title,style: TextStyle(color: Colors.black,fontSize: getSp(24)),)
        ],
      ),
    );
  }

  Widget noUser(){
    return Container(
      //height: getWidthPx(400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('手机电脑多端同步，尽享海量高品质音乐',style: TextStyle(color: Colors.black,fontSize: getSp(24)),),
          getSizeBox(height: getWidthPx(30)),
          GestureDetector(
            onTap: (){
              push(LoginPage());
            },
            child: Container(
              width: getWidthPx(200),height: getWidthPx(60),
              decoration: BoxDecoration(
                color: Colors.red,borderRadius: BorderRadius.circular(getHeightPx(40))
              ),
              alignment: Alignment.center,
              child: Text('立即登录',style: TextStyle(color: Colors.white,fontSize: getSp(30)),),
            ),
          ),
          getSizeBox(height: getWidthPx(60)),
          userCenter(),

        ],
      ),
    );
  }

  Widget functionWidget(){
    return Column(
      children: <Widget>[
        rowItem(Icons.settings_voice, '听歌识曲'),
        rowItem(Icons.settings_input_hdmi, '演出'),
        rowItem(Icons.local_mall, '商城'),
        rowItem(Icons.location_on, '附近的人'),
        rowItem(Icons.games, '游戏推荐'),
        rowItem(Icons.music_note, '口袋彩铃'),
        getSizeBox(height: getWidthPx(20)),
        Divider(height: getWidthPx(1),color: Color.fromRGBO(238, 238, 238, 1),),
        getSizeBox(height: getWidthPx(20)),
        rowItem(Icons.alarm, '定时关闭'),
        rowItem(Icons.filter_center_focus, '扫一扫'),
        rowItem(Icons.headset, '边听边存'),
        rowItem(Icons.web, '在线听歌免流量'),
        rowItem(Icons.headset_off, '音乐黑名单'),
        rowItem(Icons.verified_user, '青少年模式'),
        rowItem(Icons.alarm_add, '音乐闹钟'),
        getSizeBox(height: getWidthPx(20)),
        Divider(height: getWidthPx(1),color: Color.fromRGBO(238, 238, 238, 1),),
        getSizeBox(height: getWidthPx(20)),
        rowItem(Icons.insert_drive_file, '我的订单'),
        rowItem(Icons.turned_in, '优惠券'),
        rowItem(Icons.help, '帮助与反馈'),
        rowItem(Icons.warning, '关于'),
        getSizeBox(height: getWidthPx(20)),
      ],
    );
  }

  Widget rowItem(IconData icon,String title){
    return Container(
      height: getWidthPx(90),
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.black,size: getWidthPx(30),),
          getSizeBox(width: getWidthPx(20)),
          Text(title,style: TextStyle(color: Colors.black,fontSize: getSp(30)),)
        ],
      ),
    );
  }

  Offset startPoint;
  Offset lastPoint;
  dragStart(DragStartDetails details){
    startPoint = details.globalPosition;

  }

  dragUpdate(DragUpdateDetails details){
    final Offset delta = details.delta;
    if(delta.dx < 0){
      setState(() {
        startPos += delta.dx;
      });
    }
    lastPoint = details.globalPosition;
  }

  dragEnd(DragEndDetails details){
    if(startPos < flag){
      closeDrawer(startPos);
    }else{
      reOpenDrawer(startPos);

    }

  }

  closeDrawer(double start){
    double time = (maxDrawerWidth-(start.abs()))/maxDrawerWidth;
    controller.reverse(from: time)
      .whenComplete((){
        pop();
    });
  }

  reOpenDrawer(double start){
    controller.reset();
    double time = (maxDrawerWidth-(start.abs()))/maxDrawerWidth;
    controller.forward(from: time);
  }
///vertical

  dragStartV(DragStartDetails details){}

  dragUpdateV(DragUpdateDetails details){
    final delta = details.delta;
    final position = scrollController.position;
    final target = position.pixels-delta.dy;
    scrollController.jumpTo(target);


  }

  dragEndV(DragEndDetails details){}


}






















