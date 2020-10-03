/*
* Author : LiJiqqi
* Date : 2020/9/27
*/


import 'package:cloud_music/base_framework/view_model/refresh_list_view_state_model.dart';

import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';
import 'package:cloud_music/page/main/entity/video_url_entity.dart';
import 'package:cloud_music/page/main/video/public_vm.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:fijkplayer/fijkplayer.dart';


enum PlayState{
  Playing,Stop
}

class DetailVM extends RefreshListViewStateModel<VideoEntity>
  with PublicVMHandler{

  final VideoGroupEntity groupEntity;

  DetailVM(this.groupEntity);

  String getName(String name){
    return name.length > 12 ? name.substring(0,12):name;
  }


  PlayState playState = PlayState.Stop;
  updateVideoState(PlayState state){
    playState = state;
    //notifyListeners();
  }

  ///是否显示封面
  bool shouldShowCover(VideoEntity entity){
    if(currentVideo == null) {
      return true;
    }else if(entity.data.vid != currentVideo.data.vid){
      return true;
    }else{
      return playState == PlayState.Stop;
    }
  }

  ///是否需要暂停
  bool needPause(VideoEntity entity,FijkPlayer player){
    return currentVideo != null
        && entity.data.vid == currentVideo.data.vid
          && player.state == FijkState.started;
  }

  VideoEntity currentVideo;
  updateCurrentVideo(VideoEntity entity){
    if(currentVideo != null && entity.data.vid == currentVideo.data.vid){
      currentVideo = null;
    }else{
      currentVideo = entity;
    }

    //notifyListeners();
  }


  Future<List<VideoUrlEntity>> getVideoUrl(String vid)async{
    return BedrockRepositoryProxy().videoApi.getVideoUrl(vid: vid);
  }

  @override
  Future<List<VideoEntity>> loadData({int pageNum}) {
    return BedrockRepositoryProxy().videoApi.getGroupDetailVideoList(id: groupEntity.id);
  }


}










