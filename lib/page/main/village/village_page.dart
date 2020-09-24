/*
* Author : LiJiqqi
* Date : 2020/9/17
*/

import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/village/vm/village_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class VillagePage extends PageState with AutomaticKeepAliveClientMixin{

  VillageVM villageVM;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(child:
        Consumer<UserViewModel>(
          builder: (ctx,userModel,child){
            return ProviderWidget<VillageVM>(
              model: VillageVM(),
              onModelReady: (model){

              },
              builder: (ctx,model,child){
                if(model.busy){
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                villageVM = model;
                return content();
              },
            );
          },
        ));
  }

  Widget content(){
    return SmartRefresher(
        controller:villageVM.refreshController ,
        enablePullDown: true,
        enablePullUp: false,
        header: MaterialClassicHeader(),
    onRefresh: _discoveryViewModel.initData,
    )
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}











