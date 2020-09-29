/*
* Author : LiJiqqi
* Date : 2020/9/29
*/



import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/song_entity.dart';
import 'package:cloud_music/service_api/base_api.dart';

class SongApi extends BaseApi{

  Future<List<SongEntity>> getSongData({int songId})async{
    var response = await bedRock.get('/song/url',
      queryParameters: {'id':songId});
    if(response == null){
      return null;
    }else{
      return response.data.data['data'].map<SongEntity>((json){
        return SongEntity.fromJson(json);
      }).toList();
    }

  }


}