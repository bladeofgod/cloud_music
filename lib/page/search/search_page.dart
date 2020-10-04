
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/search/vm/search_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends PageState{

  SearchViewModel searchViewModel;

  @override
  Widget build(BuildContext context) {

    return switchStatusBar2Dark(child: Consumer<UserViewModel>(
      builder: (ctx,userModel,child){
        return ProviderWidget<SearchViewModel>(
          model: SearchViewModel(),
          onModelReady: (model){
            //model.initData();
          },
          builder: (ctx,model,child){
            if(model.busy){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
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
              controller: searchViewModel.textEditingController,
              onChanged: (text){
                searchViewModel.updateKeyWord(text);
              },
              onSubmitted: (text){
                //todo search
                searchViewModel.updateKeyWord(text);
              },
              style: TextStyle(color: Colors.black,fontSize: getSp(36)),
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
                hintText: 'hello',
                hintStyle: TextStyle(color: Colors.grey,fontSize: getSp(36)),
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
          historyWidget(),
          getSizeBox(height: getWidthPx(50)),
          ///title
          searchTitle(),
          getSizeBox(height: getWidthPx(40)),
          Divider(
            color: Color.fromRGBO(230, 230, 230, 1),
            height: getWidthPx(2),
          ),
          /// hot search
          hotSearch(),



        ],
      ),
    );
  }

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
                children: searchViewModel.temp.
                map<Widget>((e){
                  return Container(
                    height: getWidthPx(50),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: getWidthPx(20)),
                    margin: EdgeInsets.only(left: getWidthPx(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getWidthPx(30)),
                        color: Color.fromRGBO(230, 230, 230, 1)
                    ),
                    child: Text('$e',style: TextStyle(color: Colors.black,
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
                child: Icon(Icons.delete_forever,color: Colors.black,size: getWidthPx(30),),
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
    return GridView.builder(
      scrollDirection: searchViewModel.gridController,
        gridDelegate: null, itemBuilder: null);
  }

}



















