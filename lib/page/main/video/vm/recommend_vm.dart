/*
* Author : LiJiqqi
* Date : 2020/9/27
*/

import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';
import 'package:cloud_music/page/main/entity/recommend_video_entity.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';

class RecommendVM extends RefreshListViewStateModel<RecommendVideoEntity>{

  final VideoGroupEntity groupEntity;

  RecommendVM(this.groupEntity);



  @override
  Future<List<RecommendVideoEntity>> loadData({int pageNum}) {
    return BedrockRepositoryProxy().videoApi.getRecommendVideoList();
  }
}






















