

/*
* 全局性provider
* 可以在此配置 全局性model
* eg: user.model et.
*
* */


import 'package:cloud_music/base_framework/view_model/app_model/app_cache_model.dart';
import 'package:cloud_music/base_framework/view_model/app_model/device_model.dart';
import 'package:cloud_music/base_framework/view_model/app_model/locale_model.dart';
import 'package:cloud_music/base_framework/view_model/app_model/user_view_model.dart';
import 'package:cloud_music/base_framework/view_model/app_model/app_status_model.dart';
import 'package:cloud_music/page/main/vm/music_controll_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers =[
  ...independentServices,
  ...dependentServices,
];

/// 应用级 独立 model(通过consumer 可以在任意页面获取到)
List<SingleChildWidget> independentServices = [
  //ChangeNotifierProvider<ThemeModel>.value(value: ThemeModel()),  //主题配置
  ChangeNotifierProvider<LocaleModel>.value(value: LocaleModel()), //国际化
  //设备model
  ChangeNotifierProvider<DeviceModel>.value(value: DeviceModel()),//设备model
  //global app cache model
  ChangeNotifierProvider<AppCacheModel>.value(value: AppCacheModel()),//项目缓存model
  //music control
  ChangeNotifierProvider<MusicControlVM>.value(value: MusicControlVM()),

  ///2020.3.10  目前应该没有购物车等可以与用户绑定,这里将用户model抽到上层
  ChangeNotifierProvider<UserViewModel>.value(value: UserViewModel()),//用户 model

];


/// 需要依赖的model,下方注释代码为例子
/// eg :UserModel 购物车model的组合（如购物车与用户ID绑定）
List<SingleChildWidget> dependentServices = [

//  ChangeNotifierProxyProvider<GlobalCartGoodsModel, UserModel>(
//    update: (context, globalCartGoodsModel, userModel) =>
//    userModel ?? UserModel(globalCartGoodsModel: globalCartGoodsModel),
//  ),
//
//  ChangeNotifierProxyProvider<UserModel,StoreModel>(
//    update: (context,userModel,storeModel)
//    => storeModel ?? StoreModel(userModel: userModel,cartGoodsModel: userModel.globalCartGoodsModel),
//  ),
];

