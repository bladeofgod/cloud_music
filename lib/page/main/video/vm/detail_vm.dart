/*
* Author : LiJiqqi
* Date : 2020/9/27
*/


import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';

import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';
import 'package:cloud_music/page/main/video/public_vm.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';

class DetailVM extends RefreshListViewStateModel<VideoEntity>
  with PublicVM{

  final VideoGroupEntity groupEntity;

  DetailVM(this.groupEntity);


  @override
  Future<List<VideoEntity>> loadData({int pageNum}) {
    return BedrockRepositoryProxy().videoApi.getGroupDetailVideoList()
  }


}










