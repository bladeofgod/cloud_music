

import 'package:flutter/material.dart';
import 'package:cloud_music/base_framework/widget_state/base_state.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';



class FadePageState extends PageState {
  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(child: Container(
      color: Colors.orangeAccent,width: getWidthPx(750),height: getHeightPx(1334),
      alignment: Alignment.center,
      child: Text("fade page"),
    ));
  }
}



























