

import 'package:cloud_music/base_framework/view_model/single_view_state_model.dart';
import 'package:cloud_music/page/main/entity/video_group_entity.dart';
import 'package:cloud_music/service_api/bedrock_repository_proxy.dart';

class VideoPageVM extends SingleViewStateModel<List<VideoGroupEntity>>{

  final List<VideoGroupEntity> groupList = [];
  VideoPageVM(){
    groupList.add(VideoGroupEntity(name: '推荐',id: 00001));
  }

  @override
  Future<List<VideoGroupEntity>> loadData() {
    return BedrockRepositoryProxy().videoApi.getVideoCateList();
  }

  @override
  onCompleted(data) {
    groupList.addAll(data);

  }

}




















