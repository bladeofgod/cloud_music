/*
* Author : LiJiqqi
* Date : 2020/9/30
*/

import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/vm/music_controll_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonPlayBtn extends WidgetState{
  final int songId;
  final Widget play;
  final Widget pause;

  CommonPlayBtn(this.songId,this.play, this.pause)
    :assert(play != null),
      assert(pause != null);


  @override
  Widget build(BuildContext context) {

    return Consumer<MusicControlVM>(
      builder: (ctx,model,child){
      return (songId == model.currentSongId
          && model.musicState == MusicControlState.Playing)
          ? pause : play;
      },);
  }

}



















