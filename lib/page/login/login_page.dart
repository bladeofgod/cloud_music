/*
* Author : LiJiqqi
* Date : 2020/9/23
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/login/vm/login_vm.dart';
import 'package:cloud_music/page/login/widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends PageState{
  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(child:
      Consumer<UserViewModel>(
        builder: (ctx,userModel,child){
          return ProviderWidget<LoginVM>(
            model: LoginVM(),
            onModelReady: (model){
              //todo
            },
            builder:(ctx,loginVM,child){

              return Container(
                width: getWidthPx(750),height: getHeightPx(1334),
                color: Color.fromRGBO(220, 44, 31, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getSizeBox(height: getWidthPx(100)),
                    LogoWidget().generateWidget(),

                  ],
                ),
              );
            } ,
          );
        },
      ));
  }

}