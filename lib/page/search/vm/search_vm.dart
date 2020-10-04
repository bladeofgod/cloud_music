


import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/search/entity/default_search_entity.dart';
import 'package:cloud_music/page/search/entity/hot_search_entity.dart';
import 'package:cloud_music/page/search/entity/search_suggest_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/cupertino.dart';

class SearchViewModel extends SingleViewStateModel{

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();


  List<int> temp = [123,321,123,23,451,65,5,757,875645,23123,53];

  DefaultSearchEntity defaultSearchEntity;
  List<HotSearchEntity> hotSearch = [];
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
    keyWord = defaultSearchEntity.realkeyword;

  }

}