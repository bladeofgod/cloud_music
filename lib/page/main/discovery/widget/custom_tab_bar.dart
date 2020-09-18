/*
* Author : LiJiqqi
* Date : 2020/9/18
*/


import 'package:cloud_music/base_framework/ui/widget/provider_widget.dart';
import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/discovery/vm/tabbar_vm.dart';
import 'package:cloud_music/page/main/discovery/widget/tab_bar_item.dart';
import 'package:flutter/material.dart';

typedef TabBarController = void Function(TabBarViewModel controller);

class CustomTabBar extends WidgetState with SingleTickerProviderStateMixin{
  final TabBarController putOut;

  CustomTabBar(this.putOut);

  TabBarViewModel parentVM;

  final double min = 1.0;
  final double max = 1.3;

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 100),vsync: this);
    animation = Tween<double>(begin: min,end: max).animate(controller);
    controller.addListener(() {
      debugPrint('animation ${animation.value}');
      if(!parentVM.isResetting){
        parentVM.updateFactor(animation.value);
      }

    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: ProviderWidget<TabBarViewModel>(
        model: TabBarViewModel(1,min,max,controller,animation),
        onModelReady: (model){
          parentVM = model;
          putOut(model);
        },
        builder: (ctx,model,child){
          return Container(
            color: Colors.white,
            height: getWidthPx(80),
            child: buildTab(),
          );
        },
      )
    );
  }

  Widget buildTab() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        wrap(TabBarItem(parentVM, '我的', 0).generateWidget()),
        wrap(TabBarItem(parentVM, '发现', 1).generateWidget()),
        wrap(TabBarItem(parentVM, '云村', 2).generateWidget()),
        wrap(TabBarItem(parentVM, '视频', 3).generateWidget()),

      ],
    );
  }

  Widget wrap(Widget child){
    return Container(
      alignment: Alignment.bottomCenter,
      width: getWidthPx(120),
      child: child,
    );
  }

}