
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/video/vm/detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';


class VideoWidget extends WidgetState{

  final VideoEntity videoEntity;
  final int index;

  VideoWidget(this.videoEntity,this.index);

  DetailVM detailVM;

  @override
  void initState() {
    detailVM = Provider.of<DetailVM>(context,listen: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Selector<DetailVM,VideoEntity>(
      selector: (ctx,vm){
        return vm.list[index];
      },
      builder: (ctx,entity,child){
        debugPrint('视频区域刷新了');
        return Stack(
          alignment: Alignment.center,
          children: [
            ShowImageUtil.showImageWithDefaultError(entity.data.coverUrl + ShowImageUtil.imgBanner
                , getWidthPx(710), getWidthPx(400),borderRadius: getHeightPx(20)),
            ///play btn
            GestureDetector(
              onTap: (){
                detailVM.updateCurrentVideo(entity);
              },
              child: (detailVM.currentVideo != null && entity.data.vid == detailVM.currentVideo.data.vid)
                  ?
              Icon(Icons.pause,color: Colors.white.withOpacity(0.8),size: getWidthPx(80),)
                :
              Icon(Icons.play_arrow,color: Colors.white.withOpacity(0.8),size: getWidthPx(80),)


            ),
          ],
        );
      },
    );
  }

}




















