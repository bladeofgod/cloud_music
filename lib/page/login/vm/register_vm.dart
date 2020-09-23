/*
* Author : LiJiqqi
* Date : 2020/9/23
*/


import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';

/*
*
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




  @override
  Future loadData() {
    return null;
  }

  @override
  onCompleted(data) {

  }

}









