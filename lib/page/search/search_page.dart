
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
          TextField(
            controller: searchViewModel.textEditingController,
            onChanged: (text){
              searchViewModel.updateKeyWord(text);
            },
            onSubmitted: (text){
              //todo search
              searchViewModel.updateKeyWord(text);
            },
            style: TextStyle(color: Colors.black,fontSize: getSp(32)),
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: getWidthPx(2))
              ),
              hintText: '${searchViewModel.defaultSearchEntity.showKeyword}',
              hintStyle: TextStyle(color: Colors.grey,fontSize: getSp(30)),
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
          ///title
          searchTitle(),



        ],
      ),
    );
  }

  historyWidget() {
    return Container(
      height: getWidthPx(140),
      color: Colors.redAccent,
    );
  }

  searchTitle() {
    return Container(
      height: getWidthPx(140),
      child: Row(
        children: [
          Container(
            width: getWidthPx(60),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(1,1),blurRadius: getWidthPx(10),
                  color: Colors.grey
                )
              ]
            ),child: Text('热搜榜',style: TextStyle(color: Colors.black,
            fontSize: getSp(30)),),
          ),
          ///list
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: searchViewModel.temp.
                map<Widget>((e){
                  return Container(
                    height: getWidthPx(60),
                    margin: EdgeInsets.only(left: getWidthPx(20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getWidthPx(30)),
                      color: Colors.grey
                    ),
                    child: Text('$e',style: TextStyle(color: Colors.black,
                    fontSize: getSp(30)),),
                  );
              }).toList(),
            ),
          ),
          ///btn
          GestureDetector(
            child: Container(
              width: getWidthPx(100),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1,1),blurRadius: getWidthPx(10),
                        color: Colors.grey
                    )
                  ]
              ),
              child: Row(
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

}



















