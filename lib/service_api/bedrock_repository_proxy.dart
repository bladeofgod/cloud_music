/*
* Author : LiJiqqi
* Date : 2020/5/28
*/



import 'package:cloud_music/service_api/discovery_api.dart';
import 'package:cloud_music/service_api/login_api.dart';
import 'package:cloud_music/service_api/mine_api.dart';
import 'package:cloud_music/service_api/song_api.dart';
import 'package:cloud_music/service_api/village_api.dart';
import 'video_api.dart';

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
  ///视频
  final VideoApi videoApi = VideoApi();
  ///登录
  final LoginApi loginApi = LoginApi();
  ///云村
  final VillageApi villageApi = VillageApi();
  ///我的
  final MineApi mineApi = MineApi();
  ///歌曲相关
  final SongApi songApi = SongApi();



}



