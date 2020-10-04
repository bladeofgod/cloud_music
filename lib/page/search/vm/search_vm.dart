


import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/search/entity/default_search_entity.dart';
import 'package:cloud_music/page/search/entity/hot_search_entity.dart';
import 'package:cloud_music/page/search/entity/search_history_entity.dart';
import 'package:cloud_music/page/search/entity/search_suggest_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/cupertino.dart';


const String _searchHistory = 'search_his';

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

  ///历史假数据
  final List<int> temp = [123,321,123,23,451,65,5,757,875645,23123,53];

  final List<SearchHistoryEntity> searchKeywords = [];

  initSearchHistory(){}

  writeHistory(SearchHistoryEntity entity){
    if(entity != null ){
      if(!searchKeywords.any((element) => element.timeStamp == entity.timeStamp)){
        searchKeywords.add(entity);
      }
    }
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

  ///搜索建议
  SearchSuggestEntity suggestEntity;
  void getSearchSuggest(){
    BedrockRepositoryProxy().searchApi.getSearchSuggest(key: keyWord)
        .then((value) {
          if(value != null){
            suggestEntity = value;
          }
    });
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
    keyWord = key;
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