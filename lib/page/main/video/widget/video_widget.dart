
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/entity/video_url_entity.dart';
import 'package:cloud_music/page/main/video/vm/detail_vm.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class VideoWidget extends WidgetState{

  final FijkPlayer player = FijkPlayer();

  final VideoEntity entity;


  VideoWidget(this.entity);

  DetailVM detailVM;

  ///视频播放地址
  VideoUrlEntity urlEntity;

  bool fetching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DetailVM>(
      builder: (ctx,vm,child){
        if(detailVM == null) detailVM = vm;
        if(detailVM.needPause(entity, player))player.pause();
        return Stack(
          alignment: Alignment.center,
          children: [
            FijkView(player: player),
            ///cover image
            Offstage(
              offstage: !detailVM.shouldShowCover(entity),
              child: ShowImageUtil.showImageWithDefaultError(entity.data.coverUrl + ShowImageUtil.imgBanner
                  , getWidthPx(710), getWidthPx(400),borderRadius: getHeightPx(20)),
            ),
            ///play btn
            Offstage(
              offstage: !detailVM.shouldShowCover(entity),
              child: GestureDetector(
                  onTap: ()async{
                    if(detailVM.playState == PlayState.Playing){
                      ///播放状态
                      if(entity.data.vid == detailVM.currentVideo.data.vid){
                        ///暂停
                        await player.pause();

                      }else{
                        ///暂停原视频，播放新的
                        playVideo();

                      }
                    }else{
                      if(detailVM.currentVideo == null){
                        ///播放新的
                        playVideo();
                      }else{
                        if(entity.data.vid == detailVM.currentVideo.data.vid){
                          ///继续
                          await player.start();
                        }else{
                          ///播放新的
                          playVideo();
                        }
                      }
                    }

                  },
                  child: fetching ?
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(
                      Colors.white),)
                      :
                  Icon(Icons.play_arrow,color: Colors.white.withOpacity(0.8),size: getWidthPx(80),)
              ),
            ),
          ],
        );
      },
    );
  }

  void playVideo(){
    fetching = true;
    detailVM.updateCurrentVideo(entity);
    detailVM.notifyListeners();
//    setState(() {
//
//    });
    detailVM.getVideoUrl(entity.data.vid)
        .then((list)async{
          fetching = false;
          if(list.isNotEmpty){
            ///只会有一个
            urlEntity = list.first;
            player.setDataSource(urlEntity.url)
              .then((value) async{
              await player.start();
            });
          }

          detailVM.updateVideoState(PlayState.Playing);
          detailVM.notifyListeners();
//          setState(() {
//
//          });
    });
  }

}




















