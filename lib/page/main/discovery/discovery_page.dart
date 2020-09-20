/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/discovery/discovery_vm.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DiscoveryPage extends PageState with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  UserViewModel _userViewModel;
  DiscoveryViewModel _discoveryViewModel;

  PageController controller;

  PageController dbContaoller;
  int dbIndex = 2;
  double initOffset = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0,viewportFraction: 1);
    dbContaoller = PageController(initialPage: 2,viewportFraction: 1/5.5);
    dbContaoller.addListener(() {
      if(initOffset == -1) initOffset = dbContaoller.offset;
      if(dbIndex == 2 && dbContaoller.position.userScrollDirection == ScrollDirection.forward){
        dbContaoller.jumpTo(initOffset);
      }

    });
  }
  @override
  void dispose() {
    controller.dispose();
    dbContaoller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(
      child: switchStatusBar2Dark(
        child: Consumer<UserViewModel>(
          builder: (ctx,userModel,child){
            _userViewModel = userModel;
            return ProviderWidget<DiscoveryViewModel>(
              model: DiscoveryViewModel(),
              onModelReady: (model){
                model.initData();
              },
              builder: (ctx,disVM,child){
                if(disVM.busy){
                  return Container(
                    child: Center(
                      child: Text('loading'),
                    ),
                  );
                }
                _discoveryViewModel = disVM;
                return buildContent();
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///banner
        getSizeBox(height: getWidthPx(40)),
        banner(),
        ///dragon zone  PS: 此处api失效，只能写静态的了。
        getSizeBox(height: getWidthPx(30)),
        dragonBall(),
      ],
    );
  }

  final double dbSize = 750/5.6;
  final double ballOffset = 30;

  Widget dragonBall(){
    return Container(
      width: getWidthPx(750),height: getWidthPx(750/5),
      margin: EdgeInsets.only(top: getWidthPx(20),bottom: getWidthPx(50)),
      child: PageView(
        onPageChanged: (index)=>dbIndex = index,
        controller: dbContaoller,
        children: _discoveryViewModel.balls.map((e){
          return Container(
            alignment: Alignment.centerLeft,
            width: getWidthPx(dbSize),height: getWidthPx(dbSize+10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImageHelper.wrapAssetsIcon(e.imgUrl),
                  height: getWidthPx(dbSize-ballOffset),
                  width: getWidthPx(dbSize-ballOffset),),
                Text('${e.title}',style: TextStyle(color: Colors.black,fontSize: getSp(22)),)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }



  Widget banner() {
    return Container(
      width: getWidthPx(750),height: getWidthPx(320),
      //padding: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: controller,
            onPageChanged: (index){
              _discoveryViewModel.switchBanner(index);
            },
            children: _discoveryViewModel.banners.map((e){
              return bannerItem(e);
            }).toList(),
          ),
          ///indicator
          Positioned(
            bottom: getWidthPx(20),
            child: indicator(),
          ),
        ],
      ),
    );
  }

  Widget indicator(){
    return Row(
      children: _discoveryViewModel.banners.map<Widget>((e){
        int index = _discoveryViewModel.banners.indexOf(e);
        return Container(
          width: getWidthPx(10),height: getWidthPx(10),
          margin: EdgeInsets.only(left: getWidthPx(10)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _discoveryViewModel.bannerIndex ? Colors.red : Colors.grey.withOpacity(0.3),
          ),
        );
      }).toList(),
    );
  }

  Widget bannerItem(DiscoveryBannerEntity e) {
    return Container(
      height: getWidthPx(320),
      //width: getWidthPx(750)-HomePage.horPadding,
      margin: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getHeightPx(16)),
      ),
      child: Stack(
        children: <Widget>[
          ShowImageUtil.showImageWithDefaultError(e.pic, getWidthPx(750)-HomePage.horPadding, getWidthPx(320),
            borderRadius: getHeightPx(16),boxFit: BoxFit.cover),
          ///tag
          Positioned(
            right: 0,bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: getWidthPx(100),height: getWidthPx(50),
              decoration: BoxDecoration(
                color: e.titleColor == 'blue'? Colors.blue
                    :Colors.red,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(getHeightPx(16)),
                    topLeft: Radius.circular(getHeightPx(16))
                ),
              ),
              child: Text(e.typeTitle,style: TextStyle(color: Colors.white,fontSize: getSp(18)),),
            ),
          )
        ],
      ),
    );
  }
  
}

















