


import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/search/entity/default_search_entity.dart';
import 'package:cloud_music/page/search/entity/hot_search_entity.dart';
import 'package:cloud_music/page/search/entity/search_suggest_entity.dart';
import 'package:flutter/cupertino.dart';

class SearchApi{

  ///热搜列表(详细)

  Future<List<HotSearchEntity>> getHotSearchList()async{
    var response = await bedRock.get('/search/hot/detail');
    if(response == null){
      return [];
    }else{
      return response.data.data['data'].map<HotSearchEntity>((json){
        return HotSearchEntity.fromJson(json);
      }).toList();
    }

  }
  
  ///获取搜索建议

  Future<SearchSuggestEntity> getSearchSuggest({@required String key})async{
    var response = await bedRock.get('/search/suggest',
      queryParameters: {'keywords':key});
    if(response == null){
      return null;
    }else{
      return SearchSuggestEntity.fromJson(response.data.data['result']);
    }
  }
  ///默认搜索词
  Future<DefaultSearchEntity> getDefaultWord()async{
    var response = await bedRock.get('/search/default');
    if(response == null){
      return null;
    }else{
      return DefaultSearchEntity.fromJson(response.data.data['data']);
    }
  }

  ///搜索多重匹配
  ///eg:search/multimatch?keywords= 海阔天空
  /// 按app来看，应该是多选项卡的，
/// 暂时未做： 1、 模块过大，2、接口类型不全、不稳定，会导致意外错误
/// 后期看情况再补上


}














