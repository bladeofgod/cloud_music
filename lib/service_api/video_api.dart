/*
* Author : LiJiqqi
* Date : 2020/9/18
*/

import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/base_framework/exception/un_authorized_exception.dart';
import 'package:cloud_music/base_framework/exception/un_handle_exception.dart';
import 'package:cloud_music/page/main/entity/recommend_video_entity.dart';
import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';
import 'package:cloud_music/page/main/entity/video_url_entity.dart';
import 'package:dio/dio.dart';

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
  Future<List<VideoEntity>> getGroupDetailVideoList({int id,int offset = 10})async{
    ///接口返回不太规范，这里不应该出现这种异常捕获
    try{
      var response = await bedRock.get('/video/group',
          queryParameters: {'id':id,'offset':offset});
      if(response == null){
        return [];
      }else{
        return response.data.data['datas'].map<VideoEntity>((json){
          return VideoEntity.fromJson(json);
        }).toList();
      }
    }catch(e,s){
      if(e is DioError){
        throw UnAuthorizedException();
      }
      return [];
    }


  }

  ///获取推荐视频
  Future<List<RecommendVideoEntity>> getRecommendVideoList()async{
    var response = await bedRock.get('/video/timeline/recommend');
    if(response == null){
      return [];
    }else{
      return response.data.data['data'].map<RecommendVideoEntity>((json){
        return RecommendVideoEntity.fromJson(json);
      }).toList();
    }
  }

  ///获取播放地址
  Future<List<VideoUrlEntity>> getVideoUrl({String vid})async{
    var response = await bedRock.get('/video/url',
        queryParameters: {'id':vid});
    if(response == null){
      return [];
    }else{
      return response.data.data['urls'].map<VideoUrlEntity>((json){
        return VideoUrlEntity.fromJson(json);
      }).toList();
    }

  }




}