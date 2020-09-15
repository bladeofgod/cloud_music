/*
* Author : LiJiqqi
* Date : 2020/5/28
*/



import 'package:cloud_music/service_api/discovery_api.dart';

class BedrockRepositoryProxy{
  static BedrockRepositoryProxy _singleton;

  factory BedrockRepositoryProxy()=>getInstance();

  BedrockRepositoryProxy._internal(){
    //do something
  }

  static BedrockRepositoryProxy getInstance(){
    if(_singleton == null){
      _singleton = BedrockRepositoryProxy._internal();
    }
    return _singleton;
  }

  ///发现
  final DiscoveryAPI discoveryAPI = DiscoveryAPI();




}



