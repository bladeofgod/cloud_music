/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/discovery/discovery_vm.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoveryPage extends PageState with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  UserViewModel _userViewModel;
  DiscoveryViewModel _discoveryViewModel;

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
      children: <Widget>[
        ///banner
        getSizeBox(height: getWidthPx(40)),
        banner(),
      ],
    );
  }



  Widget banner() {
    return Container(
      width: getWidthPx(750),height: getWidthPx(320),
      padding: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
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
      height: getWidthPx(320),width: getWidthPx(750)-HomePage.horPadding,
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

















