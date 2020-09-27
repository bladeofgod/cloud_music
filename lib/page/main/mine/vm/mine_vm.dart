/*
* Author : LiJiqqi
* Date : 2020/9/27
*/


import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/entity/mine/user_detail_entity.dart';
import 'package:cloud_music/page/main/entity/mine/user_like_entity.dart';
import 'package:cloud_music/page/main/entity/user_song_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/cupertino.dart';

class MineVM extends SingleViewStateModel{

  final UserViewModel userViewModel;
  final ScrollController controller = ScrollController();

  MineVM(this.userViewModel);

  UserDetailEntity userDetailEntity;
  ///用户喜欢的音乐
  UserLikeEntity likeEntity;
  ///歌单
  List<UserSongEntity> songList;

  int selectIndex = 0;
  switchIndex(int index){
    selectIndex = index;
    notifyListeners();
  }


  int getUserLvl(){
    return userDetailEntity.level;
  }

  int likeMusicCount(){
    if(likeEntity == null){
      return 0;
    }else{
      return likeEntity.likes.length;
    }

  }


  @override
  Future loadData() {
    List<Future> futures = [];
    futures.add(BedrockRepositoryProxy().mineApi.getDetailData());
    futures.add(BedrockRepositoryProxy().mineApi.getUserLikeSongs(userId: userViewModel.userId));
    futures.add(BedrockRepositoryProxy().mineApi.getUserSongList(userId: userViewModel.userId));
    var result = Future.wait(futures);
    return result;
  }

  @override
  onCompleted(data) {
    userDetailEntity = data[0];
    likeEntity = data[1];
    songList = data[2];

  }

}