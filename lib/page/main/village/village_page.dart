/*
* Author : LiJiqqi
* Date : 2020/9/17
*/

import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:flutter/material.dart';


class VillagePage extends PageState with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.orange,
      child: Text('village page'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}











