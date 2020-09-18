/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/discovery/discovery_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoveryPage extends PageState with AutomaticKeepAliveClientMixin{

  UserViewModel _userViewModel;
  DiscoveryViewModel _discoveryViewModel;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(
      child: switchStatusBar2Dark(
        child: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('discovery'),
        ),
//        Consumer<UserViewModel>(
//          builder: (ctx,userModel,child){
//            _userViewModel = userModel;
//            return ProviderWidget<DiscoveryViewModel>(
//              model: DiscoveryViewModel(),
//              onModelReady: (model){
//                model.initData();
//              },
//              builder: (ctx,disVM,child){
//                _discoveryViewModel = disVM;
//                return buildContent();
//              },
//            );
//          },
//        ),
      ),
    );
  }

  Widget buildContent() {}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  
}

















