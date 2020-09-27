/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/login/login_page.dart';
import 'package:cloud_music/page/main/mine/vm/mine_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
        return ProviderWidget<MineVM>(
          model: MineVM(),
          onModelReady: (model){
            model.initData();
          },
          builder: (ctx,model,child){
            mineVM = model;
            return buildContent();
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
          getSizeBox(height: getWidthPx(120)),
          userWidget(),
        ],
      ),
    );
  }


  userWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidthPx(10)),
      height: getWidthPx(120),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: userViewModel.hasUser
            ? noUser() : hasUser(),
      ),
    );
  }
  List<Widget> noUser(){
      return <Widget>[
        Icon(Icons.person_pin,color: Colors.pinkAccent,size: getWidthPx(100),),
        Positioned(
          left: getWidthPx(120),
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
                  Icon(Icons.chevron_right,color: Colors.black,size: getWidthPx(22),),
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
          getWidthPx(100), getWidthPx(100),borderRadius: getWidthPx(50)),
      ///user name
      Positioned(
        top: getWidthPx(10),
        left: getWidthPx(120),
        child: Text('${userViewModel.userName}',style: TextStyle(color: Colors.black,
              fontSize: getSp(32)) ,),
      ),

      ///user tag
      Positioned(
        bottom: getWidthPx(10),
        left: getWidthPx(120),
        child: Row(
          children: <Widget>[],
        ),
      ),




    ];
  }

}