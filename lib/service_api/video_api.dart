/*
* Author : LiJiqqi
* Date : 2020/9/18
*/

import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';

import 'base_api.dart';

class VideoApi extends BaseApi{


  ///视频标签列表
  Future<List<VideoGroupEntity>> getVideoCateList()async{
    var response = await bedRock.get('/video/group/list');

    if(response == null){
      return [];
    }else{
      return response.data.data['data'].map<VideoGroupEntity>((json){
        return VideoGroupEntity.fromJson(json);
      }).toList();
    }

  }

  ///视频标签/分类下的视频
  Future getGroupDetailVideoList({String id,int offset = 0})async{
    var response = await bedRock.get('/video/group',
        queryParameters: {'id':id,'offset':offset});
    return response;
  }




}