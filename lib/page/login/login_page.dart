/*
* Author : LiJiqqi
* Date : 2020/9/23
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/utils/image_helper.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/login/register_page.dart';
import 'package:cloud_music/page/login/vm/login_vm.dart';
import 'package:cloud_music/page/login/widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';


class LoginPage extends PageState{
  
  final Color redColor = Color.fromRGBO(220, 44, 31, 1);

  bool isAgree = false;


  @override
  void initState() {

    super.initState();
  }
  
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
                color: redColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getSizeBox(height: getWidthPx(100)),
                    LogoWidget().generateWidget(),
                    getSizeBox(height: getWidthPx(260)),
                    GestureDetector(
                      onTap: (){
                        if(!isAgree){
                          showHint();
                        }else{
                          push(RegisterPage());
                        }
                        
                      },
                      child: buildBtn('立即登录', Colors.white, redColor),
                    ),
                    getSizeBox(height: getWidthPx(40)),
                    GestureDetector(
                      onTap: (){
                        if(!isAgree){
                          showHint();
                        }else{
                          pop();
                        }

                      },
                      child: buildBtn('立即体验', redColor, Colors.white),
                    ),
                    getSizeBox(height: getWidthPx(50)),
                    ///third
                    thirdLogin(),
                    getSizeBox(height: getWidthPx(50)),
                    contractWidget(),
                  ],
                ),
              );
            } ,
          );
        },
      ));
  }

  void showHint(){
    showToast('请勾选下方的同意');
  }

  Widget contractWidget(){
    return Container(
      width: getWidthPx(600),height: getWidthPx(100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              isAgree = !isAgree;
              setState(() {

              });
            },
            child: Container(
              alignment: Alignment.topLeft,
              color: redColor,
              width: getWidthPx(80),//height: getWidthPx(30),
              child: Row(
                children: <Widget>[
                  checkWidget(),
                  Text('  同意',style: TextStyle(color: Colors.grey,fontSize: getSp(18)),)
                ],
              ),
            ),
          ),
          
          Text('   《用户协议》 《隐私政策》 《儿童隐私政策》\n   《中国联通认证服务协议》',
            style: TextStyle(color: Colors.white,fontSize: getSp(22)),)
        ],
      ),
    );
  }

  Widget checkWidget(){
    return isAgree?
            Icon(Icons.check,color: Colors.white,size: getWidthPx(22),)
      : Icon(Icons.check_box_outline_blank,color: Colors.grey,size: getWidthPx(22),);
  }

  Widget thirdLogin(){
    return Container(
      width: getWidthPx(600),height: getWidthPx(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(ImageHelper.wrapAssetsIcon('wechat'),width: getWidthPx(80),height: getWidthPx(80),),
          Image.asset(ImageHelper.wrapAssetsIcon('qq'),width: getWidthPx(80),height: getWidthPx(80),),
          Image.asset(ImageHelper.wrapAssetsIcon('weibo'),width: getWidthPx(80),height: getWidthPx(80),),
          Image.asset(ImageHelper.wrapAssetsIcon('net163'),width: getWidthPx(80),height: getWidthPx(80),),
        ],
      ),
    );
  }

  Widget buildBtn(String title,Color bgColor,Color textColor){
    return Container(
      width: getWidthPx(600),height: getWidthPx(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: Colors.white,width: getWidthPx(1)),
        borderRadius: BorderRadius.circular(getHeightPx(50))
      ),
      child: Text(title,style: TextStyle(fontSize: getSp(32),color: textColor),),
    );
  }

}