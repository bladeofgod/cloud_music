/*
* Author : LiJiqqi
* Date : 2020/9/27
*/

import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/entity/recommend_video_entity.dart';
import 'package:cloud_music/page/main/entity/video_entity.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';
import 'package:cloud_music/page/main/video/vm/detail_vm.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailPage extends PageState with AutomaticKeepAliveClientMixin{

  TabController parentController;

  final int index;
  final VideoGroupEntity entity;
  final DetailVM detailVM;

  DetailPage(this.entity,this.index,this.parentController)
    :detailVM = DetailVM(entity);

  int currentIndex = 0;

  @override
  void initState() {
    parentController.addListener(() {
      if(mounted){
        currentIndex = parentController.index;
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (ctx,userModel,child){
        return ProviderWidget<DetailVM>(
          model: detailVM,
          onModelReady: (model){
            model.initData();
          },
          builder: (ctx,model,child){
            if(model.busy){
              return Container(
                child: Center(child: CircularProgressIndicator(),),
              );
            }
            if(model.empty){
              return Container(
                child: Center(child: RaisedButton(
                  child: Text('暂无推荐视频，请稍后再试'),
                  onPressed: model.initData,
                ),),
              );
            }
            return Container(
              color: Color.fromRGBO(238, 238, 238, 1),
              child: SmartRefresher(
                controller:detailVM.refreshController ,
                enablePullDown: true,
                enablePullUp: false,
                header: MaterialClassicHeader(),
                onRefresh: detailVM.initData,
                child: ListView.builder(
                  itemCount: detailVM.list.length,
                  itemBuilder: (ctx,index){
                    return item(index);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget item(int index){
    final VideoEntity entity = detailVM.list[index];
    return Container(
      color: Colors.white,
      width: getWidthPx(750),height: getWidthPx(584),
      padding: EdgeInsets.all(getWidthPx(20)),
      margin: EdgeInsets.only(bottom: getWidthPx(20)),
      child: Column(
        children: <Widget>[
          coverImg(entity),
          getSizeBox(height: getWidthPx(10)),
          ///title
          title(entity),
          getSizeBox(height: getWidthPx(10)),
          Divider(height: getWidthPx(1),color: Color.fromRGBO(238, 238, 238, 1),),
          getSizeBox(height: getWidthPx(10)),

          ///user
          userRow(entity),




        ],
      ),
    );
  }

  final double margin = 10;

  coverImg(VideoEntity entity) {
    return Container(
      height: getWidthPx(350),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ShowImageUtil.showImageWithDefaultError(entity.data.coverUrl + ShowImageUtil.imgBanner
              , getWidthPx(710), getWidthPx(400),borderRadius: getHeightPx(20)),
          ///play btn
          GestureDetector(
            onTap: (){
              //todo
            },
            child: Icon(Icons.play_arrow,color: Colors.white.withOpacity(0.8),size: getWidthPx(80),),
          ),
          ///describe
          if(entity.data.description!= null && entity.data.description.isNotEmpty)
          Positioned(
            right: getWidthPx(margin),top: getWidthPx(margin),
            child: Container(
              height: getWidthPx(30),
              //width: getWidthPx(200),
              padding: EdgeInsets.symmetric(horizontal: getWidthPx(10)),
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 0.3),
                borderRadius: BorderRadius.circular(getHeightPx(10))
              ),
              child: Text('${detailVM.getDescriShortly(entity.data.description)}',style: TextStyle(color: Colors.white
                  ,fontSize: getSp(20)),maxLines: 1,overflow: TextOverflow.ellipsis ,),
            ),
          ),
          ///playtime
          Positioned(
            left: getWidthPx(margin),bottom:getWidthPx(margin) ,
            child: Container(
              alignment: Alignment.center,
              //height: getWidthPx(30),
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_circle_outline,size: getWidthPx(22),color: Colors.white,),
                  getSizeBox(width: getWidthPx(10)),
                  Text('${detailVM.getPlayTimes(entity.data.playTime)}',
                    style: TextStyle(color: Colors.white,fontSize: getSp(22)),)
                ],
              ),
            ),
          ),
          ///duration
          Positioned(
            right: getWidthPx(margin),bottom:getWidthPx(margin) ,
            child: Container(
              height: getWidthPx(30),
              child: Row(
                children: <Widget>[
                  Icon(Icons.equalizer,size: getWidthPx(22),color: Colors.white,),
                  getSizeBox(width: getWidthPx(10)),
                  Text('${detailVM.getVideoDuration(entity.data.durationms)}',
                    style: TextStyle(color: Colors.white,fontSize: getSp(22)),)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

  title(VideoEntity entity) {
    return Container(
      height: getWidthPx(80),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: getWidthPx(80),
              child: Text('${entity.data.title}',style: TextStyle(color: Colors.black,fontSize: getSp(26)),
                maxLines: 2,overflow: TextOverflow.ellipsis,),
            ),
          ),
          getSizeBox(width: getWidthPx(10)),
          ShowImageUtil.showImageWithDefaultError(entity.data.creator.backgroundUrl + ShowImageUtil.img50,
              getWidthPx(80), getWidthPx(80),borderRadius: getWidthPx(40)),
        ],
      ),
    );
  }

  userRow(VideoEntity entity) {
    return Container(
      height: getWidthPx(80),
      child: Row(
        children: <Widget>[
          ShowImageUtil.showImageWithDefaultError(entity.data.creator.avatarUrl + ShowImageUtil.img50
              , getWidthPx(80), getWidthPx(80),borderRadius: getWidthPx(40)),
          getSizeBox(width: getWidthPx(20)),
          Text('${entity.data.creator.nickname}',style: TextStyle(color: Colors.black,
                fontSize: getSp(26)),),
          Expanded(
            child: const SizedBox(),
          ),
          ///赞
          Container(
            height: getWidthPx(80),
            width: getWidthPx(100),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    //todo
                  },
                  child: Icon(Icons.thumb_up,size: getWidthPx(40),
                    color:entity.data.praised ?Colors.red: Colors.grey,),
                ),
                Positioned(left: getWidthPx(55), top: getWidthPx(5),
                  child: Text(detailVM.getPraisedCount(entity.data.praisedCount),
                    style: TextStyle(fontSize: getSp(16),color: Colors.grey),),)
              ],
            ),
          ),
          getSizeBox(width: getWidthPx(10)),
          ///评论
          Container(
            height: getWidthPx(80),
            width: getWidthPx(100),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    //todo
                  },
                  child: Icon(Icons.message,size: getWidthPx(40),
                    color:Colors.grey,),
                ),
                Positioned(left: getWidthPx(45), top: getWidthPx(0),
                  child: Container(
                    padding: EdgeInsets.all(getWidthPx(8)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),child: Text(detailVM.getPraisedCount(entity.data.praisedCount),
                    style: TextStyle(fontSize: getSp(16),color: Colors.grey),),
                  ),)
              ],
            ),
          ),
          ///more
          getSizeBox(width: getWidthPx(40)),
          Icon(Icons.more_vert,size: getWidthPx(40),color: Colors.grey,)

        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => needKeep();

  bool needKeep() {
    return (index - currentIndex).abs() < 3;
  }
  

}






















