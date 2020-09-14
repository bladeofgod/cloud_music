/*
* Author : LiJiqqi
* Date : 2020/6/5
*/

import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';
import 'package:cloud_music/page/demo_page/main/second/entity/second_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';


class SecondViewModel extends RefreshListViewStateModel<SecondEntity>{
  @override
  Future<List<SecondEntity>> loadData({int pageNum}) {
    return BedrockRepositoryProxy.getInstance().getSectionOne().getSecondList(pageNum);
  }



}






























