/*
* Author : LiJiqqi
* Date : 2020/9/18
*/


import 'package:cloud_music/base_framework/widget_state/widget_state.dart';
import 'package:cloud_music/page/main/discovery/vm/tabbar_vm.dart';
import 'package:flutter/material.dart';


class TabBarItem extends WidgetState {

  final TabBarViewModel parentVM;
  final String text;
  final double textSize;
  final index;

  TabBarItem(this.parentVM,this.text,this.index,{this.textSize = 20})
    :assert(parentVM!=null),assert(text.isNotEmpty);




  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Text(text,
      textScaleFactor:(index == parentVM.pageIndex
          ?parentVM.textScaleFactor :
            (index == parentVM.getLastIndex())
                ? parentVM.max-(parentVM.textScaleFactor-parentVM.min) : parentVM.min) ,
      style: TextStyle(fontSize: textSize,
        color: index == parentVM.pageIndex?Colors.black:Colors.grey),);
  }

}












