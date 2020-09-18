/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';
import 'package:cloud_music/page/main/entity/discovery_page_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';

class DiscoveryViewModel extends RefreshListViewStateModel{

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










