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
import 'package:cloud_music/page/main/discovery/widget/music_calendar.dart';
import 'package:cloud_music/page/main/entity/blocks/block_1.dart' as block1;
import 'package:cloud_music/page/main/entity/blocks/block_2.dart' as block2;
import 'package:cloud_music/page/main/entity/blocks/block_4.dart' as block4;
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
            getSizeBox(height: getWidthPx(20)),
            dragonBall(),
            ///对应接口没找到，自由发挥了
            ///人气推荐  block1
            popSongRecommend(),
            ///我与民谣 bla bla... 注意 实体内songPrivilege的id
            ///或者resourceId可以获取到mp3 url 其他不行
            youAndWhat(),
            getSizeBox(height: getWidthPx(60)),
            ///block3  音乐日历
            musicCalendar(),
            getSizeBox(height: getWidthPx(60)),
            ///没有找到合适的数据 还用block1
            popSongRecommend(),
            getSizeBox(height: getWidthPx(60)),
            ///block4
            block4Widget(),
            getSizeBox(height: getWidthPx(60)),

            getSizeBox(height: getWidthPx(100)),
            ///footer
            footer(),
            getSizeBox(height: getWidthPx(100))
          ],
        ),
      ),
    );
  }

  Widget block4Widget(){
    block4.Block4 b4 = _discoveryViewModel.pageData.blocks['block4'];

    return Container(
      width: getWidthPx(750),
      //height: getWidthPx(470),
      child: Column(
        children: [
          ///title
          titleRow(b4.uiElement.subTitle.title,GestureDetector(
            onTap: (){
              //todo
            },
            child: circleBtn(Text('查看更多'),30),
          )),
          ///list
          listBlock4(b4),
        ],
      ),

    );
  }

  Widget listBlock4(block4.Block4 blocks){
    return Container(
      width: getWidthPx(750),height: getWidthPx(430),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: blocks.extInfo.squareFeedViewDTOList.map((e){
          return b4Item(e,e == blocks.extInfo.squareFeedViewDTOList.last);
        }).toList(),
      ),
    );
  }

  Widget b4Item(block4.SquareFeedViewDTOList c,bool isLast){
    return Container(
      width: getWidthPx(250),height: getWidthPx(370),
      margin: EdgeInsets.only(left: HomePage.horPadding,
          right: isLast?getWidthPx(HomePage.horPadding):0),
      child: Stack(
        children: [
          ///image
          b4Item0Image(c),

          //getSizeBox(height: getWidthPx(10)),
          ///title
          Positioned(
            top: getWidthPx(300),
            child: b4Item0Title(c),
          ),
        ],
      ),
    );
  }

  Widget b4Item0Image(block4.SquareFeedViewDTOList c){
    return Container(
      width: getWidthPx(250),height: getWidthPx(320),
      child: Stack(
        children: [
          ShowImageUtil.showImageWithDefaultError(c.resource.mlogBaseData.coverUrl,
              getWidthPx(250), getWidthPx(320),borderRadius: getHeightPx(10)),
          Positioned(
            left: getWidthPx(20),bottom: getWidthPx(25),
            child: Text(
              '${c.resource.mlogExt.likedCount} 赞',
              style:TextStyle(color: Colors.white,fontSize: getSp(24)),
            ),
          ),
        ],
      ),
    );
  }

  Widget b4Item0Title(block4.SquareFeedViewDTOList c){
    return Container(
      padding: EdgeInsets.only(top: getWidthPx(15)),
      height: getWidthPx(100),width: getWidthPx(250),
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(getHeightPx(10)),bottomLeft: Radius.circular(getHeightPx(10)))
      ),
      child: Text('${c.resource.mlogBaseData.text}',style: TextStyle(
          color: Colors.black,fontSize: getSp(24)
      ),maxLines: 2,overflow: TextOverflow.ellipsis,),
    );
  }

  ///block3

  Widget musicCalendar(){
    return MusicCalendar(_discoveryViewModel.pageData.blocks['block3']).generateWidget();
  }


  Widget youAndWhat(){
    block2.Block2 block = _discoveryViewModel.pageData.blocks['block2'];
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
            ],),30),
          )),
          getSizeBox(height: getWidthPx(20)),
          ///page
          songPage(block),
        ],
      ),
    );

  }

  Widget songPage(block2.Block2 blocks){
    //final pageNum = (blocks.creatives.length/3).ceil();
    return Container(
      width: getWidthPx(750),height: getWidthPx(500),
      child: PageView(
        controller: youAndContraoller,
        children: blocks.creatives.map((e){
          return songPageItem(e);
        }).toList(),
      ),
    );
  }
  
  Widget songPageItem(block2.Creatives creatives){
    return Container(
      width: getWidthPx(750*0.9),height: getWidthPx(500),
      child: Column(
        children: creatives.resources.map<Widget>((res) {
            return pageInnerItem(res);
        }).toList(),
      ),
    );
  }
  
  Widget pageInnerItem(block2.Resources resources){
    return Container(
      width: getWidthPx(750*0.9),height: getWidthPx(140),
      margin: EdgeInsets.only(bottom: getWidthPx(20)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: ShowImageUtil.showImageWithDefaultError(
              resources.uiElement.image.imageUrl, getWidthPx(140), getWidthPx(140)
                    ,borderRadius: getWidthPx(10)),
          ),
          ///title
          Positioned(
            left: getWidthPx(150),
            top: getWidthPx(20),
            child: Text('${resources.uiElement.mainTitle.title}',style: TextStyle(color: Colors.black
                ,fontSize: getSp(30)),),
          ),
          ///sub title
          Positioned(
            left: getWidthPx(150),
            bottom: getWidthPx(20),
            child: Text('${resources.uiElement?.subTitle?.title??''}',style: TextStyle(color: Colors.grey
                ,fontSize: getSp(30)),),
          ),
          ///play btn
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                //todo
              },
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(right: getWidthPx(60)),
                child: Icon(Icons.play_circle_outline,color: Colors.redAccent,size: getWidthPx(60),),
              ),
            ),
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
    block1.Block1 block = _discoveryViewModel.pageData.blocks['block1'];
    return Container(
      width: getWidthPx(750),
      //height: getWidthPx(470),
      child: Column(
        children: [
          ///title
          titleRow(block.uiElement.subTitle.title,GestureDetector(
            onTap: (){
              //todo
            },
            child: circleBtn(Text('查看更多'),30),
          )),
          ///list
          listHor(block),
        ],
      ),

    );
  }

  Widget listHor(block1.Block1 blocks){
    return Container(
      width: getWidthPx(750),height: getWidthPx(360),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: blocks.creatives.map((e){
          return buildItem0(e,e == blocks.creatives.last);
        }).toList(),
      ),
    );
  }

  Widget buildItem0(block1.Creatives c,bool isLast){
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

  Widget item0Image(block1.Creatives c){
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

  Widget item0Title(block1.Creatives c){
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

  Widget circleBtn(Widget child,double radius){
    return Container(
      alignment: Alignment.center,
      height: getWidthPx(54),
      padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getHeightPx(radius)),
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
      margin: EdgeInsets.only(top: getWidthPx(20),bottom: getWidthPx(20)),
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

















