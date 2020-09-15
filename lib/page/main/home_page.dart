/*
* Author : LiJiqqi
* Date : 2020/9/15
*/

import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/material.dart';

class HomePage extends PageState{
  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
        child:Container(
          width: getWidthPx(750),height: getHeightPx(1334),
          color: Colors.white,
          alignment: Alignment.center,
          child: RaisedButton(
            onPressed: (){
              BedrockRepositoryProxy().discoveryAPI.getBanner(type: 1)
                .then((list) {
                  debugPrint('${list.toString()}');
              });

            },
            child: Text('get api'),
          ),
        ) );
  }

}





















