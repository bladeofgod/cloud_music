
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/video/vm/detail_vm.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class VideoWidget extends WidgetState{

  final FijkPlayer player = FijkPlayer();

  final VideoEntity entity;


  VideoWidget(this.entity);

  DetailVM detailVM;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DetailVM>(
      builder: (ctx,vm,child){
        if(detailVM == null) detailVM = vm;
        return Stack(
          alignment: Alignment.center,
          children: [
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
                  onTap: (){
                    detailVM.updateCurrentVideo(entity);
                  },
                  child: Icon(Icons.play_arrow,color: Colors.white.withOpacity(0.8),size: getWidthPx(80),)
              ),
            ),
          ],
        );
      },
    );
  }

}




















