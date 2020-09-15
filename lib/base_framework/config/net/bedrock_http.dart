

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import '../../utils/exception_pitcher.dart';
import 'package:cloud_music/base_framework/config/net/base_http.dart';
import 'package:cloud_music/base_framework/config/storage_manager.dart';



final BedRock bedRock = BedRock();


class BedRock extends BaseHttp{

  final String china = "http://120.53.224.74:3000";


  @override
  void init() {

    options.baseUrl = china;
    interceptors
      ..add(CookieManager(PersistCookieJar(dir: StorageManager.appDirectory.path)))
      ..add(ApiInterceptor());
  }

}



class ApiInterceptor extends InterceptorsWrapper{

  @override
  Future onRequest(RequestOptions options) async{
    ///这里将空值参数去除掉，可根据自己的需求更改
    options.queryParameters.removeWhere((key, value) => value == null);

    String params="";
    String mark = "&";

    if(!kReleaseMode){
      debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
          ' queryParameters: ${options.queryParameters}'
              ' formdata  : ${options.data.toString()}' );
      options.queryParameters.forEach((k,v){
        if(v == null) return;
        params = "$params${params.isEmpty?"":mark}$k=$v";
      });
      debugPrint("---api-request--->url--> ${options.baseUrl}${options.path}?$params");
    }




    //debugPrint("request header  :  ${options.headers.toString()}");
    return options;
  }


  @override
  Future onResponse(Response response) {
    ///根据网易云api 进行调整
    /// api返回的数据类型比较蛋疼，所以实体中可能会有大量 dynamic类型,免费的也没啥可挑剔的...
    ResponseData responseData = ResponseData.fromResponse(response);
    if(responseData.success){
      return bedRock.resolve(responseData);
    }else{
      ///这里可以根据不同的业务代码 扔出不同的异常
      ///具体要根据后台进行协商
      throw ExceptionPitcher().transformException(responseData);
    }


  }



}





class ResponseData extends BaseResponseData {
  bool get success => (code == 1 || code == 200);

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
  ///根据网易云api

  ResponseData.fromResponse(Response response){
    code = response.data['code'];
    message = response.data['message'];
    data = response.data;
  }
}