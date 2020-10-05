
import 'package:cloud_music/base_framework/ui/widget/progress_widget.dart';
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/utils/show_image_util.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/search/vm/search_vm.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class SearchPage extends PageState{

  SearchViewModel searchViewModel;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    _focusNode.addListener(() {
      if(!mounted) return;
      if(_focusNode.hasFocus){
        //todo
        showSuggestOverlay(true);
      }else{
        showSuggestOverlay(false);
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    showSuggestOverlay(false);
    searchViewModel.textEditingController
        ..clear()
        ..dispose();
    _focusNode.unfocus();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return switchStatusBar2Dark(child: Consumer<UserViewModel>(
      builder: (ctx,userModel,child){
        return ProviderWidget<SearchViewModel>(
          model: SearchViewModel(),
          onModelReady: (model){
            model.initData();
          },
          builder: (ctx,model,child){
            if(model.busy){
              return Container(
                child: Center(
                  child: Common163MusicLoading().generateWidget(),
                ),
              );
            }

            if(searchViewModel == null)searchViewModel = model;

            return Container(
              width: getWidthPx(750),height: getHeightPx(1334),
              padding: EdgeInsets.symmetric(horizontal: getWidthPx(30)),
              child: Column(
                children: [
                  appBar(),
                  getSizeBox(height: getWidthPx(40)),
                  Expanded(child: pageContent()),
                ],
              ),
            );
          },
        );
      },
    ));
  }

  bool overlayShow = false;

  void showSuggestOverlay(bool show){
    if(overlayShow == show){
      return;
    }
    overlayShow = show;
    if(show){
      searchViewModel.suggestOverlay = buildSuggestOverlay();
      Overlay.of(context).insert(searchViewModel.suggestOverlay);
    }else{
      _focusNode.unfocus();
      searchViewModel.resetSuggestState();
      searchViewModel.suggestOverlay?.remove();
    }
  }

  Widget overlayRoot(Widget child){
    return Positioned(
      left: getWidthPx(30),top: getWidthPx(180),
      child: Material(
        child: GestureDetector(
          onTap: (){
            showSuggestOverlay(false);
          },
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            width: getWidthPx(690),height: getWidthPx(1334-180.0),
            child: Container(
              alignment: Alignment.center,
              width: getWidthPx(690),height: getHeightPx(600),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: getWidthPx(5),color: Color.fromRGBO(200, 200, 200, 1)
                  ),
                ]
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry buildSuggestOverlay(){
    return OverlayEntry(
      builder: (ctx){
        if(searchViewModel.suggestState == RequestState.Empty){
          return overlayRoot(Text('暂时没有搜索建议'));
        }
        if(searchViewModel.suggestState == RequestState.Busy){
          return overlayRoot(Common163MusicLoading().generateWidget());
        }
        final List<Widget> children = [];
        children.add(suggestItemWrapper(GestureDetector(
          onTap: searchViewModel.doSearch,
          child: Text('搜索"${searchViewModel.keyWord}"',style: TextStyle(
              color: Colors.lightBlueAccent,fontSize: getSp(32)
          ),
        ))));
        children.addAll(searchViewModel.suggestEntity.allMatch
            .map<Widget>((e){
          return GestureDetector(
            onTap: (){
              //todo
              showToast(e.keyword);
              searchViewModel.doSearch(key: e.keyword);
            },
            child: suggestItemWrapper(Row(
              children: [
                Icon(Icons.search,color:const Color.fromRGBO(200, 200, 200, 1),size: getWidthPx(40),),
                getSizeBox(width: 10),
                Text(e.keyword,style: TextStyle(color:const Color.fromRGBO(200, 200, 200, 1),
                    fontSize: getSp(32)),)
              ],
            ),needBorder: true),
          );
        }).toList());
        return overlayRoot(ListView(
          padding: EdgeInsets.all(0),
          children: children,
        ));

      }
    );
  }

  Widget suggestItemWrapper(Widget child,{bool needBorder = false}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidthPx(30)),
      alignment: Alignment.centerLeft,
      height: getWidthPx(90),
      decoration: BoxDecoration(
        border: needBorder
            ?Border(top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1),width: getWidthPx(1)),
          bottom:  BorderSide(color: Color.fromRGBO(230, 230, 230, 1),width: getWidthPx(1)))
            :null
      ),
      child: child,
    );
  }

  Widget appBar(){
    return Container(
      width: getWidthPx(690),height: getWidthPx(160),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: pop,
            child: Icon(Icons.arrow_back,color: Colors.black,size: getWidthPx(40),),
          ),
          getSizeBox(width: getWidthPx(30)),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: searchViewModel.textEditingController,
              onChanged: (text){
                searchViewModel.updateKeyWord(text);
              },
              onSubmitted: (text){
                //todo search
                searchViewModel.doSearch();
              },
              style: TextStyle(color: Colors.black,fontSize: getSp(40)),
              decoration: InputDecoration(
                contentPadding:const EdgeInsets.all(0),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),//s
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),// earchViewModel.defaultSearchEntity.showKeyword
                hintText: '${searchViewModel.defaultSearchEntity.showKeyword}',
                hintStyle: TextStyle(color: Colors.grey,fontSize: getSp(40)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageContent() {
    return SingleChildScrollView(
      controller: searchViewModel.scrollController,
      child: Column(
        children: [
          ///历史
          if(searchViewModel.searchKeywords.isNotEmpty)
          historyWidget(),
          getSizeBox(height: getWidthPx(50)),
          ///title
          searchTitle(),
          getSizeBox(height: getWidthPx(30)),
          Divider(
            color: Color.fromRGBO(230, 230, 230, 1),
            height: getWidthPx(2),
          ),
          getSizeBox(height: getWidthPx(20)),
          /// hot search
          hotSearch(),
          ///show all
          if(searchViewModel.moreThan10() && !searchViewModel.showAllHot)
          showAll(),
          getSizeBox(height: getWidthPx(40)),
          ///zone
          zoneWidget(),

          ///blank
          getSizeBox(height: getWidthPx(100))
        ],
      ),
    );
  }

  zoneWidget(){
    return Container(
      height: getWidthPx(550),
      child: GridView.builder(
        padding: EdgeInsets.all(0),
        itemCount: searchViewModel.zoneTags.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisSpacing: getWidthPx(20),crossAxisSpacing: getWidthPx(20),
            childAspectRatio: 2.8
          ), itemBuilder: (ctx,index){
          return Image.asset(ImageHelper.wrapAssetsIcon(searchViewModel.zoneTags[index]));
      }),
    );
  }
  ///用渐变也可以 gradient
  historyWidget() {
    return Container(
      height: getWidthPx(60),width: getWidthPx(690),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [

          ///list
          Positioned(
            left: getWidthPx(100),
            child: Container(
              width: getWidthPx(550),height: getWidthPx(60),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: searchViewModel.searchKeywords.
                map<Widget>((e){
                  return Container(
                    height: getWidthPx(50),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
                    margin: EdgeInsets.only(left: getWidthPx(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getWidthPx(30)),
                        color: Color.fromRGBO(238, 238, 238, 1)
                    ),
                    child: Text('${e.keyword}',style: TextStyle(color: Colors.black,
                        fontSize: getSp(30)),),
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              height: getWidthPx(60),
              alignment: Alignment.center,
              width: getWidthPx(80),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(getWidthPx(20),1),blurRadius: getWidthPx(14),
                        spreadRadius: getWidthPx(15),
                        color: Colors.white
                    )
                  ]
              ),child: Text('历史',style: TextStyle(color: Colors.black,
                fontSize: getSp(30)),),
            ),
          ),

          ///btn
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: searchViewModel.clearHistory,
              child: Container(
                alignment: Alignment.center,
                height: getWidthPx(60),
                width: getWidthPx(60),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-getWidthPx(14),0),blurRadius: getWidthPx(14),
                          spreadRadius: getWidthPx(15),
                          color: Colors.white
                      )
                    ]
                ),
                child: Icon(Icons.delete_outline,color: Colors.grey,size: getWidthPx(50),),
              ),
            ),
          ),

        ],
      ),
    );
  }

  searchTitle() {
    return Container(
      height: getWidthPx(60),width: getWidthPx(690),
      child: Row(
        children: [
          Container(
            height: getWidthPx(60),
            alignment: Alignment.center,
            width: getWidthPx(100),
            child: Text('热搜榜',style: TextStyle(color: Colors.black,
              fontSize: getSp(30)),),
          ),
          Expanded(
            child: const SizedBox(),
          ),

          ///btn
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: getWidthPx(60),
              width: getWidthPx(188),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getWidthPx(30)),
                  border: Border.all(color: Color.fromRGBO(230, 230, 230, 1),width: getWidthPx(2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow,color: Colors.black,size: getWidthPx(30),),
                  Text('播放全部',style: TextStyle(color: Colors.black,fontSize: getSp(30)),)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  hotSearch() {
    return Container(
      //color: Colors.yellow,
      height: searchViewModel.showAllHot ?
      getWidthPx(searchViewModel.getMaxGridHeight()) : getWidthPx(300),
      child: GridView.builder(
        padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          controller: searchViewModel.gridController,
          itemCount: searchViewModel.showHotList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,mainAxisSpacing: getWidthPx(20),crossAxisSpacing: 0,
            childAspectRatio:9 ),
          itemBuilder: (ctx,index){
            return hotItem(index);
          }),
    );
  }

  hotItem(int index){
    bool isHot = index<3;
    return Container(
      child: Row(
        children: [
          Text('${index+1}',style: TextStyle(color: isHot ? Colors.red
              :Color.fromRGBO(200, 200, 200, 1),
            fontSize: getSp(30),),),
          getSizeBox(width: getWidthPx(20)),
          Text('${searchViewModel.getHotName(index)}',style: TextStyle(
            fontSize: getSp(30),
              color: Colors.black,fontWeight: isHot?FontWeight.bold:FontWeight.normal
          ),),
          getSizeBox(width: getWidthPx(20)),
          if(searchViewModel.getHotTag(index).isNotEmpty)
            ShowImageUtil.showImageWithDefaultError(searchViewModel.getHotTag(index),
                getWidthPx(50), getWidthPx(30),boxFit: BoxFit.contain)
        ],
      ),
    );
  }

  showAll() {
    return GestureDetector(
      onTap: searchViewModel.switchShowAll,
      child: Container(
        height: getWidthPx(70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('展开更多热搜',style: TextStyle(
                color:Color.fromRGBO(200, 200, 200, 1),fontSize: getSp(32)
            ),),
            getSizeBox(width: getWidthPx(10)),
            Icon(Icons.keyboard_arrow_down,size: getWidthPx(32),color: Color.fromRGBO(200, 200, 200, 1),),
          ],
        ),
      ),
    );
  }

}



















