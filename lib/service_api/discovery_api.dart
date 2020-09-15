/*
* Author : LiJiqqi
* Date : 2020/9/15
*/


import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';

class DiscoveryAPI{

  Future<List<DiscoveryBannerEntity>> getBanner({int type = 1})async{
    var response = await bedRock.get('/banner',queryParameters: {'type':type});
    if(response == null){
      return [];
    }else{
      return response.data.data['banners'].map<DiscoveryBannerEntity>((json){
        return DiscoveryBannerEntity.fromJson(json);
      }).toList();
    }

  }

}
















