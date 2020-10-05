


import 'package:cloud_music/base_framework/ui/widget/progress_widget.dart';
import 'package:cloud_music/base_framework/widget_state/page_state.dart';
import 'package:flutter/material.dart';

///just for test
class TestPage extends PageState{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        width: getWidthPx(750),height: getHeightPx(1334),
        alignment: Alignment.center,
        child: Common163MusicLoading().generateWidget(),
      ),
    );
  }

}