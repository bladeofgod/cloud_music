/*
* Author : LiJiqqi
* Date : 2020/9/17
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/main/discovery/discovery_vm.dart';
import 'package:cloud_music/page/main/entity/discovery_banner_entity.dart';
import 'package:cloud_music/page/main/entity/discovery_page_entity.dart' as pageEntity;
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscoveryPage extends PageState with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  UserViewModel _userViewModel;
  DiscoveryViewModel _discoveryViewModel;
  
  PageController youAndContraoller;
  
  PageController controller;

  PageController dbContaoller;
  int dbIndex = 2;
  double initOffset = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    youAndContraoller = PageController(initialPage: 0,viewportFraction: 0.9);
    controller = PageController(initialPage: 0,viewportFraction: 1);
    dbContaoller = PageController(initialPage: 2,viewportFraction: 1/5.5);
    dbContaoller.addListener(() {
      if(initOffset == -1) initOffset = dbContaoller.offset;
      if(dbIndex == 2 && dbContaoller.position.userScrollDirection == ScrollDirection.forward){
        dbContaoller.jumpTo(initOffset);
      }

    });
  }
  @override
  void dispose() {
    controller.dispose();
    dbContaoller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(
      child: switchStatusBar2Dark(
        child: Consumer<UserViewModel>(
          builder: (ctx,userModel,child){
            _userViewModel = userModel;
            return ProviderWidget<DiscoveryViewModel>(
              model: DiscoveryViewModel(),
              onModelReady: (model){
                model.initData();
              },
              builder: (ctx,disVM,child){
                if(disVM.busy){
                  return Container(
                    child: Center(
                      child: Text('loading'),
                    ),
                  );
                }
                _discoveryViewModel = disVM;
                return buildContent();
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildContent() {
    return SmartRefresher(
      controller:_discoveryViewModel.refreshController ,
      enablePullDown: true,
      enablePullUp: false,
      header: ClassicHeader(),
      onRefresh: _discoveryViewModel.initData,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///banner
            getSizeBox(height: getWidthPx(40)),
            banner(),
            ///dragon zone  PS: 此处api失效，只能写静态的了。
            getSizeBox(height: getWidthPx(30)),
            dragonBall(),
            ///对应接口没找到，自由发挥了
            ///人气推荐
            popSongRecommend(),
            ///我与民谣 bla bla... 注意 实体内songPrivilege的id
            ///或者resourceId可以获取到mp3 url 其他不行
            youAndWhat(),

            getSizeBox(height: getWidthPx(100)),
            ///footer
            footer(),
            getSizeBox(height: getWidthPx(100))
          ],
        ),
      ),
    );
  }


  Widget youAndWhat(){
    var block = _discoveryViewModel.pageData.blocks[1];
    return Container(
      width: getWidthPx(750),
      child: Column(
        children: [
          ///title
          titleRow(block.uiElement.subTitle.title,GestureDetector(
            onTap: (){
              //todo
            },
            child: circleBtn(Row(children: [
              Icon(Icons.play_arrow,size: 22,),Text('播放全部'),
            ],)),
          )),
          getSizeBox(height: getWidthPx(20)),
          ///page
          songPage(block),
        ],
      ),
    );

  }

  Widget songPage(pageEntity.Blocks blocks){
    //final pageNum = (blocks.creatives.length/3).ceil();
    return PageView(
      controller: youAndContraoller,
      children: blocks.creatives.map((e){
        return songPageItem(e);
      }).toList(),
    );
  }
  
  Widget songPageItem(pageEntity.Creatives creatives){
    return Container(
      width: getWidthPx(750*0.9),height: getWidthPx(500),
      child: Column(
        children: creatives.resources.map<Widget>((res) {
            return pageInnerItem(res);
        }).toList(),
      ),
    );
  }
  
  Widget pageInnerItem(pageEntity.Resources resources){
    return Container(
      width: getWidthPx(750*0.9),height: getWidthPx(120),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: ShowImageUtil.showImageWithDefaultError(
              resources., , height),
          ),
        ],
      ),
    );
  }

  Widget footer(){
    return GestureDetector(
      onTap: (){
        //todo
      },
      child: Container(
        width: getWidthPx(750),
        child: Text('${_discoveryViewModel.pageData.pageConfig.nodataToast}',
          style: TextStyle(color: Colors.black,fontSize: getSp(22)),),
      ),
    );
  }

  Widget popSongRecommend(){
    var block = _discoveryViewModel.pageData.blocks[0];
    return Container(
      //color: Colors.red,
      width: getWidthPx(750),
      //height: getWidthPx(470),
      child: Column(
        children: [
          ///title
          titleRow(block.uiElement.subTitle.title,GestureDetector(
            onTap: (){
              //todo
            },
            child: circleBtn(Text('查看更多')),
          )),
          ///list
          listHor(block),
        ],
      ),

    );
  }

  Widget listHor(pageEntity.Blocks blocks){
    return Container(
      width: getWidthPx(750),height: getWidthPx(370),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: blocks.creatives.map((e){
          return buildItem0(e,e == blocks.creatives.last);
        }).toList(),
      ),
    );
  }

  Widget buildItem0(pageEntity.Creatives c,bool isLast){
    return Container(
      width: getWidthPx(250),height: getWidthPx(300),
      margin: EdgeInsets.only(left: HomePage.horPadding,
          right: isLast?getWidthPx(HomePage.horPadding):0),
      child: Column(
        children: [
          ///image
          item0Image(c),

          getSizeBox(height: getWidthPx(10)),
          ///title
          item0Title(c),
        ],
      ),
    );
  }

  Widget item0Image(pageEntity.Creatives c){
    return Container(
      width: getWidthPx(250),height: getWidthPx(250),
      child: Stack(
        children: [
          ShowImageUtil.showImageWithDefaultError(c.uiElement.image.imageUrl,
              getWidthPx(250), getWidthPx(250),borderRadius: getHeightPx(10)),
          Positioned(
            right: getWidthPx(5),top: getWidthPx(5),
            child: Row(
              children: [
                Icon(Icons.play_arrow,color: Colors.white,size: getWidthPx(25),),
                Text(
                   _discoveryViewModel.adjustPlayCount(c.resources.first.resourceExtInfo.playCount),
                    style:TextStyle(color: Colors.white,fontSize: getSp(20)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget item0Title(pageEntity.Creatives c){
    return Text('${c.uiElement.mainTitle.title}',style: TextStyle(
      color: Colors.black,fontSize: getSp(24)
    ),maxLines: 2,overflow: TextOverflow.ellipsis,);
  }

  double blockTitleSize = 32;
  
  Widget titleRow(String title,Widget tailChild){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
      width: getWidthPx(750),height: getWidthPx(80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Colors.black,
          fontSize: getSp(blockTitleSize),fontWeight: FontWeight.bold),),
          tailChild,
        ],
      ),
    );
  }

  Widget circleBtn(Widget child){
    return Container(
      alignment: Alignment.center,
      height: getWidthPx(54),
      padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getHeightPx(20)),
        border: Border.all(color: Colors.black,width: getWidthPx(1))
      ),
      child: child,
    );
  }


  final double dbSize = 750/5.6;
  final double ballOffset = 30;

  Widget dragonBall(){
    return Container(
      width: getWidthPx(750),height: getWidthPx(750/5),
      margin: EdgeInsets.only(top: getWidthPx(20),bottom: getWidthPx(50)),
      child: PageView(
        onPageChanged: (index)=>dbIndex = index,
        controller: dbContaoller,
        children: _discoveryViewModel.balls.map((e){
          return Container(
            alignment: Alignment.centerLeft,
            width: getWidthPx(dbSize),height: getWidthPx(dbSize+10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImageHelper.wrapAssetsIcon(e.imgUrl),
                  height: getWidthPx(dbSize-ballOffset),
                  width: getWidthPx(dbSize-ballOffset),),
                Text('${e.title}',style: TextStyle(color: Colors.black,fontSize: getSp(22)),)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }



  Widget banner() {
    return Container(
      width: getWidthPx(750),height: getWidthPx(320),
      //padding: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: controller,
            onPageChanged: (index){
              _discoveryViewModel.switchBanner(index);
            },
            children: _discoveryViewModel.banners.map((e){
              return bannerItem(e);
            }).toList(),
          ),
          ///indicator
          Positioned(
            bottom: getWidthPx(20),
            child: indicator(),
          ),
        ],
      ),
    );
  }

  Widget indicator(){
    return Row(
      children: _discoveryViewModel.banners.map<Widget>((e){
        int index = _discoveryViewModel.banners.indexOf(e);
        return Container(
          width: getWidthPx(10),height: getWidthPx(10),
          margin: EdgeInsets.only(left: getWidthPx(10)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _discoveryViewModel.bannerIndex ? Colors.red : Colors.grey.withOpacity(0.3),
          ),
        );
      }).toList(),
    );
  }

  Widget bannerItem(DiscoveryBannerEntity e) {
    return Container(
      height: getWidthPx(320),
      //width: getWidthPx(750)-HomePage.horPadding,
      margin: EdgeInsets.symmetric(horizontal: HomePage.horPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getHeightPx(16)),
      ),
      child: Stack(
        children: <Widget>[
          ShowImageUtil.showImageWithDefaultError(e.pic, getWidthPx(750)-HomePage.horPadding, getWidthPx(320),
            borderRadius: getHeightPx(16),boxFit: BoxFit.cover),
          ///tag
          Positioned(
            right: 0,bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: getWidthPx(100),height: getWidthPx(50),
              decoration: BoxDecoration(
                color: e.titleColor == 'blue'? Colors.blue
                    :Colors.red,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(getHeightPx(16)),
                    topLeft: Radius.circular(getHeightPx(16))
                ),
              ),
              child: Text(e.typeTitle,style: TextStyle(color: Colors.white,fontSize: getSp(18)),),
            ),
          )
        ],
      ),
    );
  }
  
}

















