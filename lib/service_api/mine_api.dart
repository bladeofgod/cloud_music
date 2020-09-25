/*
* Author : LiJiqqi
* Date : 2020/9/25
*/

import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/recommend_song_entity.dart';
import 'package:cloud_music/page/main/entity/user_song_entity.dart';
import 'package:cloud_music/service_api/base_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:markdown_widget/markdown_helper.dart';

class MineApi extends BaseApi{


  Future<List<RecommendSongEntity>> getRecommendSongList({int limit = 8})async{
    var response = await bedRock.get('/personalized'
      ,queryParameters: {'limit':limit});

    if(response == null){
      return [];
    }else{
      return response.data.data['result'].map<RecommendSongEntity>((json){
        return RecommendSongEntity.fromJson(json);
      }).toList();
    }

  }

  Future<List<UserSongEntity>> getUserSongList({@required int userId})async{
    var response = await bedRock.get('/user/playlist'
        ,queryParameters: {'uid':userId});

    if(response == null){
      return [];
    }else{
      return response.data.data['playlist'].map<UserSongEntity>((json){
        return UserSongEntity.fromJson(json);
      }).toList();
    }
  }

}