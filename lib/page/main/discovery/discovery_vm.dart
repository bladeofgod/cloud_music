/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';
import 'package:cloud_music/page/main/entity/discovery_page_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../entity/dragon_ball_entity.dart';

class DiscoveryViewModel extends RefreshListViewStateModel{

  RefreshController refreshController;
  DiscoveryViewModel(){
    refreshController = RefreshController();
  }

  String adjustPlayCount(int count){
    return count < 10000 ? '$count'
        : '${(count/10000).ceil()}万';
  }


  ///dragon ball

  final List<DragonBallEntity> balls = [
    DragonBallEntity('每日推荐','daily_recom'),
    DragonBallEntity('私人FM','p_fm'),
    DragonBallEntity('歌单','song_list'),
    DragonBallEntity('排行榜','rank'),
    DragonBallEntity('直播','live'),
    DragonBallEntity('电台','radio'),
    DragonBallEntity('火钳刘明','sign_b_hot'),
    DragonBallEntity('数字专区','digital_record'),
    DragonBallEntity('畅聊','sing_chat'),
  ];

  List<DiscoveryBannerEntity> banners;
  DiscoveryPageEntity pageData;

  int bannerIndex = 0;
  switchBanner(int index){
    bannerIndex = index;
    notifyListeners();
  }

  @override
  Future<List> loadData({int pageNum}) {
    List<Future> futures = [];
    futures.add(BedrockRepositoryProxy().discoveryAPI.getBanner());
    futures.add(BedrockRepositoryProxy().discoveryAPI.getMainPage());

    var result = Future.wait(futures);
    return result;

  }

  @override
  onCompleted(List data) {
    banners = data[0]??[];
    pageData = data[1]??null;
  }


}










