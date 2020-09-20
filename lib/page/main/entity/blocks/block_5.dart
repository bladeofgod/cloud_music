class Block5 {
  String blockCode;
  String showType;
  String alg;
  String logInfo;
  String action;
  String actionType;
  List<ExtInfo> extInfo;
  UiElement uiElement;
  bool canClose;

  Block5(
      {this.blockCode,
        this.showType,
        this.alg,
        this.logInfo,
        this.action,
        this.actionType,
        this.extInfo,
        this.uiElement,
        this.canClose});

  Block5.fromJson(Map<String, dynamic> json) {
    blockCode = json['blockCode'];
    showType = json['showType'];
    alg = json['alg'];
    logInfo = json['logInfo'];
    action = json['action'];
    actionType = json['actionType'];
    if (json['extInfo'] != null) {
      extInfo = new List<ExtInfo>();
      json['extInfo'].forEach((v) {
        extInfo.add(new ExtInfo.fromJson(v));
      });
    }
    uiElement = json['uiElement'] != null
        ? new UiElement.fromJson(json['uiElement'])
        : null;
    canClose = json['canClose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockCode'] = this.blockCode;
    data['showType'] = this.showType;
    data['alg'] = this.alg;
    data['logInfo'] = this.logInfo;
    data['action'] = this.action;
    data['actionType'] = this.actionType;
    if (this.extInfo != null) {
      data['extInfo'] = this.extInfo.map((v) => v.toJson()).toList();
    }
    if (this.uiElement != null) {
      data['uiElement'] = this.uiElement.toJson();
    }
    data['canClose'] = this.canClose;
    return data;
  }
}

class ExtInfo {
  int popularity;
  int verticalCoverId;
  String verticalCover;
  UserInfo userInfo;
  RecLiveDTO recLiveDTO;
  String coverTag;
  String privateTag;
  Null borderTag;
  String startStreamTagName;
  List<Null> tags;
  DynamicCover dynamicCover;
  int liveId;
  String title;
  int anchorId;
  int coverId;
  String cover;
  LiveUrl liveUrl;
  String playBackUrl;
  int orientationScope;
  int onlineNumber;
  int liveStatus;
  int startTime;
  int endTime;
  int roomId;
  Null channelId;
  int liveType;
  int appKeyType;
  int type;
  int startStreamTag;
  int agoraRoomNo;
  String bgCoverUrl;
  Null backgroundAnimateUrl;

  ExtInfo(
      {this.popularity,
        this.verticalCoverId,
        this.verticalCover,
        this.userInfo,
        this.recLiveDTO,
        this.coverTag,
        this.privateTag,
        this.borderTag,
        this.startStreamTagName,
        this.tags,
        this.dynamicCover,
        this.liveId,
        this.title,
        this.anchorId,
        this.coverId,
        this.cover,
        this.liveUrl,
        this.playBackUrl,
        this.orientationScope,
        this.onlineNumber,
        this.liveStatus,
        this.startTime,
        this.endTime,
        this.roomId,
        this.channelId,
        this.liveType,
        this.appKeyType,
        this.type,
        this.startStreamTag,
        this.agoraRoomNo,
        this.bgCoverUrl,
        this.backgroundAnimateUrl});

  ExtInfo.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'];
    verticalCoverId = json['verticalCoverId'];
    verticalCover = json['verticalCover'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    recLiveDTO = json['recLiveDTO'] != null
        ? new RecLiveDTO.fromJson(json['recLiveDTO'])
        : null;
    coverTag = json['coverTag'];
    privateTag = json['privateTag'];
    borderTag = json['borderTag'];
    startStreamTagName = json['startStreamTagName'];
//    if (json['tags'] != null) {
//      tags = new List<Null>();
//      json['tags'].forEach((v) {
//        tags.add(new Null.fromJson(v));
//      });
//    }
    dynamicCover = json['dynamicCover'] != null
        ? new DynamicCover.fromJson(json['dynamicCover'])
        : null;
    liveId = json['liveId'];
    title = json['title'];
    anchorId = json['anchorId'];
    coverId = json['coverId'];
    cover = json['cover'];
    liveUrl =
    json['liveUrl'] != null ? new LiveUrl.fromJson(json['liveUrl']) : null;
    playBackUrl = json['playBackUrl'];
    orientationScope = json['orientationScope'];
    onlineNumber = json['onlineNumber'];
    liveStatus = json['liveStatus'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    roomId = json['roomId'];
    channelId = json['channelId'];
    liveType = json['liveType'];
    appKeyType = json['appKeyType'];
    type = json['type'];
    startStreamTag = json['startStreamTag'];
    agoraRoomNo = json['agoraRoomNo'];
    bgCoverUrl = json['bgCoverUrl'];
    backgroundAnimateUrl = json['backgroundAnimateUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['verticalCoverId'] = this.verticalCoverId;
    data['verticalCover'] = this.verticalCover;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.recLiveDTO != null) {
      data['recLiveDTO'] = this.recLiveDTO.toJson();
    }
    data['coverTag'] = this.coverTag;
    data['privateTag'] = this.privateTag;
    data['borderTag'] = this.borderTag;
    data['startStreamTagName'] = this.startStreamTagName;
//    if (this.tags != null) {
//      data['tags'] = this.tags.map((v) => v.toJson()).toList();
//    }
    if (this.dynamicCover != null) {
      data['dynamicCover'] = this.dynamicCover.toJson();
    }
    data['liveId'] = this.liveId;
    data['title'] = this.title;
    data['anchorId'] = this.anchorId;
    data['coverId'] = this.coverId;
    data['cover'] = this.cover;
    if (this.liveUrl != null) {
      data['liveUrl'] = this.liveUrl.toJson();
    }
    data['playBackUrl'] = this.playBackUrl;
    data['orientationScope'] = this.orientationScope;
    data['onlineNumber'] = this.onlineNumber;
    data['liveStatus'] = this.liveStatus;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['roomId'] = this.roomId;
    data['channelId'] = this.channelId;
    data['liveType'] = this.liveType;
    data['appKeyType'] = this.appKeyType;
    data['type'] = this.type;
    data['startStreamTag'] = this.startStreamTag;
    data['agoraRoomNo'] = this.agoraRoomNo;
    data['bgCoverUrl'] = this.bgCoverUrl;
    data['backgroundAnimateUrl'] = this.backgroundAnimateUrl;
    return data;
  }
}

class UserInfo {
  int userId;
  String nickname;
  String avatarUrl;
  int authStatus;
  int userType;
  String authName;
  int liveRoomNo;
  int vipType;
  int gender;
  Null artistName;

  UserInfo(
      {this.userId,
        this.nickname,
        this.avatarUrl,
        this.authStatus,
        this.userType,
        this.authName,
        this.liveRoomNo,
        this.vipType,
        this.gender,
        this.artistName});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
    authStatus = json['authStatus'];
    userType = json['userType'];
    authName = json['authName'];
    liveRoomNo = json['liveRoomNo'];
    vipType = json['vipType'];
    gender = json['gender'];
    artistName = json['artistName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['avatarUrl'] = this.avatarUrl;
    data['authStatus'] = this.authStatus;
    data['userType'] = this.userType;
    data['authName'] = this.authName;
    data['liveRoomNo'] = this.liveRoomNo;
    data['vipType'] = this.vipType;
    data['gender'] = this.gender;
    data['artistName'] = this.artistName;
    return data;
  }
}

class RecLiveDTO {
  String skipUrl;
  String typeDesc;
  int cardType;
  String alg;
  String anchorId;
  int songId;
  int accompanimentId;
  Null supplemetParam;
  String ops;
  int recCoverId;
  Null recCover;

  RecLiveDTO(
      {this.skipUrl,
        this.typeDesc,
        this.cardType,
        this.alg,
        this.anchorId,
        this.songId,
        this.accompanimentId,
        this.supplemetParam,
        this.ops,
        this.recCoverId,
        this.recCover});

  RecLiveDTO.fromJson(Map<String, dynamic> json) {
    skipUrl = json['skipUrl'];
    typeDesc = json['typeDesc'];
    cardType = json['cardType'];
    alg = json['alg'];
    anchorId = json['anchorId'];
    songId = json['songId'];
    accompanimentId = json['accompanimentId'];
    supplemetParam = json['supplemetParam'];
    ops = json['ops'];
    recCoverId = json['recCoverId'];
    recCover = json['recCover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skipUrl'] = this.skipUrl;
    data['typeDesc'] = this.typeDesc;
    data['cardType'] = this.cardType;
    data['alg'] = this.alg;
    data['anchorId'] = this.anchorId;
    data['songId'] = this.songId;
    data['accompanimentId'] = this.accompanimentId;
    data['supplemetParam'] = this.supplemetParam;
    data['ops'] = this.ops;
    data['recCoverId'] = this.recCoverId;
    data['recCover'] = this.recCover;
    return data;
  }
}

class DynamicCover {
  int priorityLevel;
  int type;
  Null playUrl;

  DynamicCover({this.priorityLevel, this.type, this.playUrl});

  DynamicCover.fromJson(Map<String, dynamic> json) {
    priorityLevel = json['priorityLevel'];
    type = json['type'];
    playUrl = json['playUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priorityLevel'] = this.priorityLevel;
    data['type'] = this.type;
    data['playUrl'] = this.playUrl;
    return data;
  }
}

class LiveUrl {
  String httpPullUrl;
  String hlsPullUrl;
  String rtmpPullUrl;

  LiveUrl({this.httpPullUrl, this.hlsPullUrl, this.rtmpPullUrl});

  LiveUrl.fromJson(Map<String, dynamic> json) {
    httpPullUrl = json['httpPullUrl'];
    hlsPullUrl = json['hlsPullUrl'];
    rtmpPullUrl = json['rtmpPullUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpPullUrl'] = this.httpPullUrl;
    data['hlsPullUrl'] = this.hlsPullUrl;
    data['rtmpPullUrl'] = this.rtmpPullUrl;
    return data;
  }
}

class UiElement {
  MainTitle mainTitle;
  SubTitle subTitle;
  Button button;

  UiElement({this.mainTitle, this.subTitle, this.button});

  UiElement.fromJson(Map<String, dynamic> json) {
    mainTitle = json['mainTitle'] != null
        ? new MainTitle.fromJson(json['mainTitle'])
        : null;
    subTitle = json['subTitle'] != null
        ? new SubTitle.fromJson(json['subTitle'])
        : null;
    button =
    json['button'] != null ? new Button.fromJson(json['button']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainTitle != null) {
      data['mainTitle'] = this.mainTitle.toJson();
    }
    if (this.subTitle != null) {
      data['subTitle'] = this.subTitle.toJson();
    }
    if (this.button != null) {
      data['button'] = this.button.toJson();
    }
    return data;
  }
}

class MainTitle {
  String title;

  MainTitle({this.title});

  MainTitle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

class SubTitle {
  String title;
  String titleImgUrl;

  SubTitle({this.title, this.titleImgUrl});

  SubTitle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleImgUrl = json['titleImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['titleImgUrl'] = this.titleImgUrl;
    return data;
  }
}

class Button {
  String action;
  String actionType;
  String text;
  Null iconUrl;

  Button({this.action, this.actionType, this.text, this.iconUrl});

  Button.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    actionType = json['actionType'];
    text = json['text'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['actionType'] = this.actionType;
    data['text'] = this.text;
    data['iconUrl'] = this.iconUrl;
    return data;
  }
}
