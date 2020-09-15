/*
* Author : LiJiqqi
* Date : 2020/5/28
*/



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';

class SectionOne{
  static SectionOne _singleton;

  factory SectionOne()=>getSingleton();

  static SectionOne getSingleton(){
    if(_singleton == null){
      _singleton = SectionOne._internal();
    }
    return _singleton;
  }

  SectionOne._internal(){
    //do stuff
  }


  ///
  final String testAPI = "";
  static const String Index_php = "index.php";

  Future getTest()async{
    var map = {
      'username':123,
      'password':'123'
    };

    var response = await bedRock.post("user/login",data: FormData.fromMap(map));

    return response;
  }


}















