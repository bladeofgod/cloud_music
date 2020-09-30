/*
* Author : LiJiqqi
* Date : 2020/9/29
*/

import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/discovery/vm/music_calendar_vm.dart';
import 'package:cloud_music/page/main/entity/load_song_entity.dart';
import 'package:cloud_music/page/main/entity/song_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

final _MusicControlVM musicController = _MusicControlVM();


class _MusicControlVM extends SingleViewStateModel with MusicController{

  _MusicControlVM(){
    init();
  }

  MusicControlState musicState = MusicControlState.None;

  ///可以绑定更多状态ICON
  switchControlState(MusicControlState state){
    musicState = state;
    notifyListeners();
  }

  void init(){
    ///播放状态
    player.playerStateStream.listen((state) {
      if(player.playing){
        switchControlState(MusicControlState.Playing);
      }else{
        switch (state.processingState) {
          case ProcessingState.none:
            switchControlState(MusicControlState.None);
            break;
          case ProcessingState.loading:
            switchControlState(MusicControlState.Loading);
            break;
          case ProcessingState.buffering:
            switchControlState(MusicControlState.Buffering);
            break;
          case ProcessingState.ready:
            switchControlState(MusicControlState.Ready);
            break;
          case ProcessingState.completed:
            switchControlState(MusicControlState.Completed);
            record[currentSongId] = const Duration(milliseconds: 0);
            break;
        }
      }
    });
    ///播放位置
    player.positionStream.listen((duration) {
      if(player.playing){
        debugPrint('songs id : $currentSongId ----$duration');
        debugPrint('all duration ${player.duration}');
        record[currentSongId] = duration;
        if(player.duration != null){
          updateMusicProgress(duration.inSeconds/player.duration.inSeconds);
        }
      }

    });

  }

  double progress = 0.0;
  updateMusicProgress(double p){
    progress = p.clamp(0.0, 1.0);
    notifyListeners();
  }



  ///provider 播放管理
  final List<LoadSongEntity> loadedSongsLocal = [];
  ///当前播放音乐
  LoadSongEntity currentSong;


  insertMusic(LoadSongEntity songEntity){
    if(checkDuplicate(songEntity.songId)){
      //todo do something
    }else{
      loadedSongsLocal.add(songEntity);
    }
    loadMusic(songEntity.songId);
  }

  bool checkDuplicate(int id){
    return loadedSongsLocal.any((element) => element.songId == id);
  }




  loadMusic(int uid){
    if(checkActualMusicDuplicate(uid)){
      _play();
    }else{
      fetchSongsData(uid);
    }

  }

  ///批量添加，这里应该不与播放 关联
  ///先不做
//  loadMusics(int uids){
//    fetchSongsData(uids);
//  }

  /// 接口定义
  /// 请求单个歌曲id ：id1
  /// 请求多个歌曲id : id1,id2,id3
  fetchSongsData(int ids){
    BedrockRepositoryProxy().songApi.getSongData(songId: ids)
      .then((value){
        actualSongs.addAll(value);
        _play();
    });
  }

  playMusic(LoadSongEntity songEntity){
    if(songEntity.songId == currentSongId){
      _resume();
    }else{
      switchControlState(MusicControlState.Playing);
      setAMusic(songEntity);
      insertMusic(songEntity);
    }
  }

  setAMusic(LoadSongEntity songEntity){
    currentSong = songEntity;
    switchSong(songEntity.songId);
    notifyListeners();
  }


  resumeMusic(){
    _resume();
  }

  pauseMusic(){
    _pause();
  }

  stopMusic(){
    _stop();
  }

  //LoadSongEntity currentSongEntity()=>loadedSongsLocal.singleWhere((element) => element.songId == currentSongId);

  String getMusicImg(){
    if(currentSong == null){
      return '';
    }
    return currentSong.coverImgUrl ;
  }

  String getMusicName(){
    if(currentSong == null){
      return '添加歌曲';
    }
    return currentSong.songName.length > 18 ? currentSong.songName.substring(0,18) :currentSong.songName ;
  }


  void playBtnTap(){
    if(currentSong != null){
      if(player.playing){
        _pause();
      }else{
        _resume();
      }
    }
  }




  @override
  Future loadData() {
    return null;
  }

  @override
  onCompleted(data) {

  }




}

enum MusicControlState{
  None,Playing,Loading,Buffering,Ready,Completed
}


class MusicController {

  final player = AudioPlayer();





  ///播放id和上次播放位置
  ///暂时考虑只记录一个
  Map<int,Duration> record = Map();

  ///当前播放的音乐
  int currentSongId = -1;

  switchSong(int songId){
    record.clear();
    currentSongId = songId;
  }


  ///服务端
  final List<SongEntity> actualSongs=[];


  _play()async{
    SongEntity s = getSong();
    await player.setUrl(s.url);
    await player.play();
  }

  _pause()async{
    if(player.playing){
      await player.pause();
    }
  }

  _resume()async{
    if(record.isNotEmpty){
      var entry = record.entries.first;
      if(entry.key == currentSongId){
        await player.seek(entry.value);
        await player.play();
      }else{
        _play();
      }
    }else{
      _play();
    }

  }

  _stop()async{
    await player.stop();
  }


  SongEntity getSong(){
    return actualSongs.singleWhere((element) => element.id == currentSongId);
  }


  checkActualMusicDuplicate(int uid){
    return actualSongs.any((element) => element.id ==uid);
  }

}

























