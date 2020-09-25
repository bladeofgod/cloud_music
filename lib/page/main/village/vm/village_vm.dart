/*
* Author : LiJiqqi
* Date : 2020/9/24
*/

import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';
import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/entity/top_10_entity.dart';
import 'package:cloud_music/page/main/entity/village_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VillageVM extends RefreshListViewStateModel<VillageEntity>{

  ///关注中，可能感兴趣的，用这个/top/artists?offset=0&limit=30 接口代替


  String getLikeCount(int count){
    return count < 10000 ? '$count' : '${(count/10000).toStringAsFixed(1)} 万';
  }



  ///关注

  RefreshController scrollController = RefreshController();

  List<TopStarEntity> startList = [];

  getStar()async{
    BedrockRepositoryProxy().villageApi.getTop10()
      .then((value){
        if(value != null){
          startList.addAll(value);
          notifyListeners();
        }
    }).whenComplete(() => scrollController.refreshCompleted());
  }



  @override
  onCompleted(data) {

  }

  @override
  Future<List<VillageEntity>> loadData({int pageNum}) {
    return BedrockRepositoryProxy().villageApi.getPlazaData();
  }

}



















