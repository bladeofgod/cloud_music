/*
* Author : LiJiqqi
* Date : 2020/9/23
*/


import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/entity/user_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';
import 'package:flutter/cupertino.dart';

/*
* 没有多余的手机号了，没法写注册了
*
* */

enum Phase{
  MobileNumber,//输入手机号
  Password,//输入密码
  VerifyCode,//输入验证码
  SetPWD,//设置密码
  NickName,//设置昵称
}

class RegisterVM extends SingleViewStateModel{

  Phase phase = Phase.MobileNumber;
  updatePhase(Phase phase){
    this.phase = phase;
    notifyListeners();
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String phone='';
  String pwd = '';

  void setPhone(String text){
    phone = text;
    notifyListeners();
  }
  void setPWD(String text){
    pwd = text;
    notifyListeners();
  }

  String getBtnText(){
    switch(phase){

      case Phase.MobileNumber:
        return '下一步';
      case Phase.Password:
        return '登录';
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

  final Color redColor = Color.fromRGBO(240, 44, 31, 1);
  final Color redColorA = Color.fromRGBO(240, 44, 31, 0.3);

  Color getBgColor(){
    switch(phase){
      
      case Phase.MobileNumber:
        return phone.isEmpty ? redColorA : redColor;
      case Phase.Password:
        return pwd.isEmpty ? redColorA : redColor;
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

  void clearPhone(){
    phoneController.clear();
    phone = '';
    notifyListeners();
  }

  void clearPWD(){
    pwdController.clear();
    pwd = '';
    notifyListeners();
  }

  Future<UserEntity> login()async{
    return await BedrockRepositoryProxy().loginApi.loginByPhonePWD(phone, pwd);
  }



  @override
  Future loadData() {
    return null;
  }

  @override
  onCompleted(data) {

  }

}









