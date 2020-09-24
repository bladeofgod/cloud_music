/*
* Author : LiJiqqi
* Date : 2020/9/24
*/


import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/village_entity.dart';
import 'package:cloud_music/service_api/base_api.dart';

class VillageApi extends BaseApi{

  Future<List<VillageEntity>> getPlazaData()async{
    var response = await bedRock.get('/comment/hotwall/list');
    if(response == null){
      return null;
    }else{
      return response.data.data['data'].map<VillageEntity>((json){
        return VillageEntity.fromJson(json);
      }).toList();
    }

  }

}
