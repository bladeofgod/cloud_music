/*
* Author : LiJiqqi
* Date : 2020/9/23
*/



import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:cloud_music/page/login/vm/register_vm.dart';
import 'package:cloud_music/page/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

///没有多余的手机号了，只能登录，没法注册

class RegisterPage extends PageState{

  RegisterVM registerVM;
  UserViewModel userViewModel;

  double horPadding ;
  @override
  void initState() {
    horPadding = getWidthPx(30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
      child: Consumer<UserViewModel>(

        builder: (ctx,userModel,child){
          this.userViewModel = userModel;
          return ProviderWidget<RegisterVM>(
            model: RegisterVM(),
            onModelReady: (model){},
            builder: (ctx,model,child){
              registerVM = model;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: horPadding),
                color: Colors.white,
                width: getWidthPx(750),height: getHeightPx(1334),
                child: Column(
                  children: <Widget>[
                    appBar(),
                    getSizeBox(height: getWidthPx(100)),
                    ///input area
                    inputArea(),
                    getSizeBox(height: getWidthPx(100)),
                    ///btn
                    GestureDetector(
                      onTap: clickBtn,
                      child: buildBtn(registerVM.getBtnText() , registerVM.getBgColor(), Colors.white),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget inputArea(){
    switch(registerVM.phase){

      case Phase.MobileNumber:
        return inputPhone();
      case Phase.Password:

        return inputPWD();
      case Phase.VerifyCode:
        // TODO: Handle this case.
        break;
      case Phase.SetPWD:
        // TODO: Handle this case.
        break;
      case Phase.NickName:
        // TODO: Handle this case.
        break;
    }
  }

  Widget inputPWD(){
    return Container(
      height: getWidthPx(80),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey,width: getWidthPx(1)))
      ),
      child: TextField(
        controller: registerVM.phoneController,
        onChanged: (text){
          registerVM.setPWD(text);
        },
        style: TextStyle(color: Colors.black,fontSize: getSp(32)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入密码',hintStyle: TextStyle(color: Colors.grey,fontSize: getSp(30)),
          suffixIcon:GestureDetector(
            onTap: (){
              if(registerVM.phoneController != null){
                registerVM.clearPWD();
              }
            },
            child: Icon(Icons.clear,color: Colors.grey,size: getWidthPx(50),),
          ),
        ),
      ),
    );

  }

  Widget inputPhone(){
    return Container(
      height: getWidthPx(80),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey,width: getWidthPx(1)))
      ),
      child: TextField(
        controller: registerVM.phoneController,
        onChanged: (text){
          registerVM.setPhone(text);
        },
        style: TextStyle(color: Colors.black,fontSize: getSp(32)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',hintStyle: TextStyle(color: Colors.grey,fontSize: getSp(30)),
          suffixIcon:GestureDetector(
            onTap: (){
              if(registerVM.phoneController != null){
                registerVM.clearPhone();
              }
            },
            child: Icon(Icons.clear,color: Colors.grey,size: getWidthPx(50),),
          ),
        ),
      ),
    );
  }

  Widget buildBtn(String title,Color bgColor,Color textColor){
    return Container(
      height: getWidthPx(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Colors.white,width: getWidthPx(1)),
          borderRadius: BorderRadius.circular(getHeightPx(50))
      ),
      child: Text(title,style: TextStyle(fontSize: getSp(32),color: textColor),),
    );
  }

  Widget appBar(){
    return Container(
      width: getWidthPx(750),height: getWidthPx(160),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: clickBackBtn,
            child: Icon(Icons.arrow_back,color: Colors.black,size: getWidthPx(40),),
          ),
          getSizeBox(width: getWidthPx(30)),
          Text('手机号登录',style: TextStyle(color: Colors.black,fontSize: getSp(32)),),
        ],
      ),
    );
  }

  void clickBackBtn(){
    switch(registerVM.phase){

      case Phase.MobileNumber:
        pop();
        break;
      case Phase.Password:
        registerVM.updatePhase(Phase.MobileNumber);
        break;
      case Phase.VerifyCode:
      // TODO: Handle this case.
        break;
      case Phase.SetPWD:
      // TODO: Handle this case.
        break;
      case Phase.NickName:
      // TODO: Handle this case.
        break;
    }
  }

  void clickBtn(){
    switch(registerVM.phase){
      case Phase.MobileNumber:
        if(registerVM.phone.isEmpty){
          showToast('手机号不能为空');
          return;
        }
        registerVM.updatePhase(Phase.Password);
        break;
      case Phase.Password:
        if(registerVM.pwd.isEmpty){
          showToast('密码不能为空');
          return;
        }
        registerVM.login().then((userEntity){
          if(userEntity == null || userEntity.code != 200){
            showToast('登录失败');
          }else{
            userViewModel.saveUser(userEntity);
            popUntil(predicate: (route)=>route.settings.name == '$HomePage');
          }
        });
        //registerVM.updatePhase(Phase.MobileNumber);
        break;
      case Phase.VerifyCode:
      // TODO: Handle this case.
        break;
      case Phase.SetPWD:
      // TODO: Handle this case.
        break;
      case Phase.NickName:
      // TODO: Handle this case.
        break;
    }
  }

}













