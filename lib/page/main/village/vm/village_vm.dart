/*
* Author : LiJiqqi
* Date : 2020/9/24
*/

import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';
import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/entity/village_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';

class VillageVM extends RefreshListViewStateModel<VillageEntity>{

  ///关注中，可能感兴趣的，用这个/top/artists?offset=0&limit=30 接口代替




  @override
  onCompleted(data) {

  }

  @override
  Future<List<VillageEntity>> loadData({int pageNum}) {
    return BedrockRepositoryProxy().villa
  }

}



















