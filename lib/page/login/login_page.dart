/*
* Author : LiJiqqi
* Date : 2020/9/23
*/


import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends PageState{
  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(child:
      Consumer<UserViewModel>(
        builder: (ctx,userModel,child){
          return
        },
      ));
  }

}