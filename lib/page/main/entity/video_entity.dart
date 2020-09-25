/*
* Author : LiJiqqi
* Date : 2020/9/25
*/


class VideoEntity {
  int type;
  bool displayed;
  String alg;
  dynamic extAlg;
  Data data;

  VideoEntity({this.type, this.displayed, this.alg, this.extAlg, this.data});

  VideoEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    displayed = json['displayed'];
    alg = json['alg'];
    extAlg = json['extAlg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['displayed'] = this.displayed;
    data['alg'] = this.alg;
    data['extAlg'] = this.extAlg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String alg;
  String scm;
  String threadId;
  String coverUrl;
  int height;
  int width;
  String title;
  String description;
  int commentCount;
  int shareCount;
  List<Resolutions> resolutions;
  Creator creator;
  dynamic urlInfo;
  List<VideoGroup> videoGroup;
  String previewUrl;
  int previewDurationms;
  bool hasRelatedGameAd;
  dynamic markTypes;
  List<dynamic> relateSong;
  dynamic relatedInfo;
  dynamic videoUserLiveInfo;
  String vid;
  int durationms;
  int playTime;
  int praisedCount;
  bool praised;
  bool subscribed;

  Data(
      {this.alg,
        this.scm,
        this.threadId,
        this.coverUrl,
        this.height,
        this.width,
        this.title,
        this.description,
        this.commentCount,
        this.shareCount,
        this.resolutions,
        this.creator,
        this.urlInfo,
        this.videoGroup,
        this.previewUrl,
        this.previewDurationms,
        this.hasRelatedGameAd,
        this.markTypes,
        this.relateSong,
        this.relatedInfo,
        this.videoUserLiveInfo,
        this.vid,
        this.durationms,
        this.playTime,
        this.praisedCount,
        this.praised,
        this.subscribed});

  Data.fromJson(Map<String, dynamic> json) {
    alg = json['alg'];
    scm = json['scm'];
    threadId = json['threadId'];
    coverUrl = json['coverUrl'];
    height = json['height'];
    width = json['width'];
    title = json['title'];
    description = json['description'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
    if (json['resolutions'] != null) {
      resolutions = new List<Resolutions>();
      json['resolutions'].forEach((v) {
        resolutions.add(new Resolutions.fromJson(v));
      });
    }
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    urlInfo = json['urlInfo'];
    if (json['videoGroup'] != null) {
      videoGroup = new List<VideoGroup>();
      json['videoGroup'].forEach((v) {
        videoGroup.add(new VideoGroup.fromJson(v));
      });
    }
    previewUrl = json['previewUrl'];
    previewDurationms = json['previewDurationms'];
    hasRelatedGameAd = json['hasRelatedGameAd'];
    markTypes = json['markTypes'];
//    if (json['relateSong'] != null) {
//      relateSong = new List<dynamic>();
//      json['relateSong'].forEach((v) {
//        relateSong.add(new dynamic.fromJson(v));
//      });
//    }
    relatedInfo = json['relatedInfo'];
    videoUserLiveInfo = json['videoUserLiveInfo'];
    vid = json['vid'];
    durationms = json['durationms'];
    playTime = json['playTime'];
    praisedCount = json['praisedCount'];
    praised = json['praised'];
    subscribed = json['subscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alg'] = this.alg;
    data['scm'] = this.scm;
    data['threadId'] = this.threadId;
    data['coverUrl'] = this.coverUrl;
    data['height'] = this.height;
    data['width'] = this.width;
    data['title'] = this.title;
    data['description'] = this.description;
    data['commentCount'] = this.commentCount;
    data['shareCount'] = this.shareCount;
    if (this.resolutions != null) {
      data['resolutions'] = this.resolutions.map((v) => v.toJson()).toList();
    }
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['urlInfo'] = this.urlInfo;
    if (this.videoGroup != null) {
      data['videoGroup'] = this.videoGroup.map((v) => v.toJson()).toList();
    }
    data['previewUrl'] = this.previewUrl;
    data['previewDurationms'] = this.previewDurationms;
    data['hasRelatedGameAd'] = this.hasRelatedGameAd;
    data['markTypes'] = this.markTypes;
//    if (this.relateSong != null) {
//      data['relateSong'] = this.relateSong.map((v) => v.toJson()).toList();
//    }
    data['relatedInfo'] = this.relatedInfo;
    data['videoUserLiveInfo'] = this.videoUserLiveInfo;
    data['vid'] = this.vid;
    data['durationms'] = this.durationms;
    data['playTime'] = this.playTime;
    data['praisedCount'] = this.praisedCount;
    data['praised'] = this.praised;
    data['subscribed'] = this.subscribed;
    return data;
  }
}

class Resolutions {
  int resolution;
  int size;

  Resolutions({this.resolution, this.size});

  Resolutions.fromJson(Map<String, dynamic> json) {
    resolution = json['resolution'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resolution'] = this.resolution;
    data['size'] = this.size;
    return data;
  }
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  dynamic expertTags;
  dynamic experts;
  int djStatus;
  int vipType;
  dynamic remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;


  Creator(
      {this.defaultAvatar,
        this.province,
        this.authStatus,
        this.followed,
        this.avatarUrl,
        this.accountStatus,
        this.gender,
        this.city,
        this.birthday,
        this.userId,
        this.userType,
        this.nickname,
        this.signature,
        this.description,
        this.detailDescription,
        this.avatarImgId,
        this.backgroundImgId,
        this.backgroundUrl,
        this.authority,
        this.mutual,
        this.expertTags,
        this.experts,
        this.djStatus,
        this.vipType,
        this.remarkName,
        this.avatarImgIdStr,
        this.backgroundImgIdStr,});

  Creator.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    expertTags = json['expertTags'];
    experts = json['experts'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    remarkName = json['remarkName'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgIdStr = json['avatarImgId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
    data['expertTags'] = this.expertTags;
    data['experts'] = this.experts;
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
    data['remarkName'] = this.remarkName;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['avatarImgId_str'] = this.avatarImgIdStr;
    return data;
  }
}

class VideoGroup {
  int id;
  String name;
  String alg;

  VideoGroup({this.id, this.name, this.alg});

  VideoGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alg'] = this.alg;
    return data;
  }
}
