/*
* Author : LiJiqqi
* Date : 2020/9/29
*/

import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/entity/load_song_entity.dart';

final _MusicControllVM musicController = _MusicControllVM();


class _MusicControllVM extends SingleViewStateModel{

  final List<LoadSongEntity> loadedSongs = [];

  loadSong(LoadSongEntity songEntity){

  }





  @override
  Future loadData() {
    return null;
  }

  @override
  onCompleted(data) {

  }

}

























