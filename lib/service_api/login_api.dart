/*
* Author : LiJiqqi
* Date : 2020/9/23
*/

import 'package:cloud_music/base_framework/config/net/bedrock_http.dart';
import 'package:cloud_music/page/main/entity/user_entity.dart';
import 'package:cloud_music/service_api/base_api.dart';

/*
* 注册暂时没做，我没有多余的手机号了
*
* */

class LoginApi extends BaseApi{


  Future<Map> checkPhoneExist(String phone)async{
    var response = await bedRock.get('/cellphone/existence/check',queryParameters: {
      'phone':phone
    });
    return response == null?null : response.data;
  }

  void sendVerifyCode(String phone)async{
    await bedRock.get('/captcha/sent',
      queryParameters: {'phone':phone});
  }

  ///验证验证码，只有个code  ： 200成功，503 错误

  Future<bool> verifyCode(String phone,String code)async{
    var response = await bedRock.get('/captcha/verify',
      queryParameters: {'phone':phone,'captcha':code});
    if(response == null){
      return false;
    }else{
      return response.data['code'] == 200;
    }
  }
  
  ///登录
  Future<UserEntity> loginByPhonePWD(String phone,String pwd)async{
    var response = await bedRock.get('/login/cellphone',
        queryParameters: {'phone':phone,'password':pwd});
    if(response == null || response.data.code != 200){
      return null;
    }else{
      return UserEntity.fromJson(response.data.data);
    }
  }

}

















