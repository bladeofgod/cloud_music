/*
* Author : LiJiqqi
* Date : 2020/9/29
*/



import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:cloud_music/page/main/widget/control_bar_btn.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music/page/main/vm/music_controll_vm.dart';
import 'package:provider/provider.dart';


class MusicControlWidget extends WidgetState{

  MusicControlVM musicController;

  @override
  Widget build(BuildContext context) {

    return Consumer<MusicControlVM>(
      builder: (ctx,model,child){
        if(musicController == null) musicController = model;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(width: getWidthPx(1),
                color: Color.fromRGBO(238, 238, 238, 1))),
          ),
          width: getWidthPx(750),height: HomePage.bottomPadding,
          //alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Positioned(
                left: getWidthPx(10),
                child: ShowImageUtil.showImageWithDefaultError(musicController.getMusicImg(),
                    getWidthPx(100), getWidthPx(100),borderRadius: getWidthPx(50)),
              ),
              Positioned(
                top: getWidthPx(15),
                left: getWidthPx(120),
                child: Text('${musicController.getMusicName()}',
                  style: TextStyle(color: Colors.black,fontSize: getSp(32)),),
              ),
              Positioned(
                bottom: getWidthPx(15),
                left: getWidthPx(120),
                child: Text('横滑可以切换上下首哦',
                  style: TextStyle(color: Colors.grey,fontSize: getSp(26)),),
              ),
              ///play
              Positioned(
                right: getWidthPx(120),
                child: GestureDetector(
                  onTap: musicController.playBtnTap,
                  child: ControlBarBtn(getWidthPx(70),getWidthPx(4),getWidthPx(50)).generateWidget()
//                  Icon(musicController.musicState == MusicControlState.Playing ?
//                  Icons.pause_circle_outline
//                      :
//                  Icons.play_circle_outline,
//                    size: getWidthPx(90),color: Colors.black,),
                ),
              ),
              ///list
              Positioned(
                right: getWidthPx(10),
                child:Image.asset(ImageHelper.wrapAssetsIcon('icon_song_list'),
                        width: getWidthPx(60),height: getWidthPx(60),),
              ),
            ],
          ),
        );
      },
    );
  }

}