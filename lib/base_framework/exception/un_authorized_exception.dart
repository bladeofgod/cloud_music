

import 'package:cloud_music/base_framework/exception/base_exception.dart';

/// 用于未登录等权限不够,需要跳转授权页面
class UnAuthorizedException extends BaseException {


  UnAuthorizedException({String message = "unAuthorizedException"}) : super(message) ;
}