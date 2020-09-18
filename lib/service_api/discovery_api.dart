/*
* Author : LiJiqqi
* Date : 2020/9/15
*/


import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';
import 'package:cloud_music/page/main/entity/discovery_page_entity.dart';

/*
* api 返回的数据结构有很大问题，不过免费的也没办法
*
*
* */

import 'base_api.dart';

class DiscoveryAPI extends BaseApi{

  ///获取发现-banner
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

  ///获取首页-发现,对不上APP，凑活用
  Future<DiscoveryPageEntity> getMainPage({bool refresh = true,int type = 1})async{
    var response = await bedRock.get('/homepage/block/page',
        queryParameters: {'refresh':refresh,'type':type});
    if(response == null){
      return null;
    }else{
      var temp = response.data;
      return DiscoveryPageEntity.fromJson(temp.data['data']);
    }
  }

}
















