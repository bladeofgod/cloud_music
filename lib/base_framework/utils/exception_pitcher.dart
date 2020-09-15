/*
* Author : LiJiqqi
* Date : 2020/5/29
*/

import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/base_framework/exception/un_authorized_exception.dart';
import 'package:cloud_music/base_framework/exception/un_handle_exception.dart';
import 'package:cloud_music/base_framework/exception/user_unbind_exception.dart';

class ExceptionPitcher{
  static ExceptionPitcher _instance;
  factory ExceptionPitcher()=>getSingleton();
  ExceptionPitcher._internal(){
    //todo
  }

  static ExceptionPitcher getSingleton(){
    if(_instance == null){
      _instance = ExceptionPitcher._internal();
    }
    return _instance;
  }

  Exception transformException(ResponseData responseData){
    switch(responseData.code){
      ///仅为以下测试代码
      case 301:
        return UnAuthorizedException();
      default:
        return UnHandleException(responseData.message??"un handle exception");
    }
  }

}



