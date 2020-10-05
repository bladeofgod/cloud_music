


import 'dart:async';
import 'dart:convert';

import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/search/entity/default_search_entity.dart';
import 'package:cloud_music/page/search/entity/hot_search_entity.dart';
import 'package:cloud_music/page/search/entity/search_history_entity.dart';
import 'package:cloud_music/page/search/entity/search_suggest_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';


const String _searchHistory = 'search_his';

enum RequestState{
  Busy,Empty,Done
}

class SearchViewModel extends SingleViewStateModel{

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ScrollController gridController = ScrollController();

  final List<String> zoneTags = [
    'icon_acg','icon_classical','icon_family','icon_fm','icon_jazz',
    'icon_listen_song','icon_singer_category','icon_voice_theater'
  ];

  SearchViewModel(){
    initSearchHistory();
  }

  ///历史数据
  final List<SearchHistoryEntity> searchKeywords = [];

  clearHistory()async{
    searchKeywords.clear();
    notifyListeners();
    await SpUtil.remove(_searchHistory);
  }

  ///只保留20个
  initSearchHistory(){
    SpUtil.getObjectList(_searchHistory)?.forEach((element) {
      debugPrint('history  $element');
      searchKeywords.add(SearchHistoryEntity.fromJson(element));
    });

    searchKeywords.sort((r,l)=>l.timeStamp.compareTo(r.timeStamp));
    if(searchKeywords.length > 20){
      searchKeywords.sublist(0,20);
    }

  }

  writeHistory(SearchHistoryEntity entity){
    if(entity != null ){
      if(!searchKeywords.any((element) => (element.timeStamp == entity.timeStamp || element.keyword == entity.keyword))){
        searchKeywords.add(entity);
        notifyListeners();
        writeLocal();
      }
    }
  }

  void writeLocal()async {
    await SpUtil.putObjectList(_searchHistory, searchKeywords);
  }


  ///
  DefaultSearchEntity defaultSearchEntity;

  List<HotSearchEntity> showHotList = [];
  List<HotSearchEntity> hotSearch = [];

  String getHotName(int index){
    return showHotList[index].searchWord.length < 7 ?
    showHotList[index].searchWord:showHotList[index].searchWord.substring(0,7);
  }

  String getHotTag(int index){
    return showHotList[index].iconUrl == null ? '':showHotList[index].iconUrl;
  }



  ///热搜
  bool showAllHot = false;

  switchShowAll(){
    showAllHot = !showAllHot;
    if(showAllHot){
      showHotList.addAll(hotSearch.sublist(10));
    }else{
      showHotList.sublist(0,10);
    }

    notifyListeners();
  }

  double getMaxGridHeight(){
    return showHotList.length/2*60.0;
  }

  bool moreThan10(){
    return hotSearch.length>10;
  }



  String keyWord ='';

  updateKeyWord(String key){
    keyWord = key??'';
    if(keyWord.isEmpty){
      keyWord = defaultSearchEntity.showKeyword;
    }
    requestSuggest();
  }
  ///请求搜索建议

  SearchSuggestEntity suggestEntity;
  Timer timer;
  RequestState suggestState = RequestState.Empty;
  resetSuggestState(){
    suggestState = RequestState.Empty;
  }

  OverlayEntry suggestOverlay;

  requestSuggest(){
    if(timer != null && timer.isActive){
      timer.cancel();
    }
    timer = Timer(Duration(seconds: 1),(){
      suggestState = RequestState.Busy;
      suggestOverlay?.markNeedsBuild();
      BedrockRepositoryProxy().searchApi.getSearchSuggest(key: keyWord)
          .then((value) {
            if(value != null){
              if(value.allMatch == null || value.allMatch.isEmpty){
                suggestState = RequestState.Empty;
              }else{
                suggestState = RequestState.Done;
              }
              suggestEntity = value;
            }else{
              suggestState = RequestState.Empty;
            }
            ///也可以用vm直接刷新，不过那样是刷新整个页面了。
            suggestOverlay?.markNeedsBuild();
      });
    });
  }

  ///搜索
  doSearch({String key}){
    if(key != null){
      ///点击搜索建议 搜索
      keyWord = key;
    }else{
      ///点击软键盘搜索
    }
    startSearch();
  }

  startSearch(){
    showToast('搜索二级页面暂未开发');
    writeHistory(SearchHistoryEntity(DateTime.now().millisecondsSinceEpoch,keyWord));
  }


  @override
  Future loadData() {
    List<Future> futures = [];
    futures.add(BedrockRepositoryProxy().searchApi.getDefaultWord());
    futures.add(BedrockRepositoryProxy().searchApi.getHotSearchList());
    return Future.wait(futures);
  }

  @override
  onCompleted(data) {
    defaultSearchEntity = data[0];
    hotSearch.addAll(data[1]);
    if(hotSearch.length>10){
      showHotList.addAll(hotSearch.sublist(0,10));
    }else{
      showHotList.addAll(hotSearch);
    }
    keyWord = defaultSearchEntity.realkeyword;

  }



}