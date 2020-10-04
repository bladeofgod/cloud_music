
import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/search/vm/search_vm.dart';
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
            model.initData();
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
      width: getWidthPx(750),height: getWidthPx(160),
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
      child: Column(),
    );
  }

}



















