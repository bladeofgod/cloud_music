class Block4 {
  String blockCode;
  String showType;
  String action;
  String actionType;
  ExtInfo extInfo;
  UiElement uiElement;
  bool canClose;

  Block4(
      {this.blockCode,
        this.showType,
        this.action,
        this.actionType,
        this.extInfo,
        this.uiElement,
        this.canClose});

  Block4.fromJson(Map<String, dynamic> json) {
    blockCode = json['blockCode'];
    showType = json['showType'];
    action = json['action'];
    actionType = json['actionType'];
    extInfo =
    json['extInfo'] != null ? new ExtInfo.fromJson(json['extInfo']) : null;
    uiElement = json['uiElement'] != null
        ? new UiElement.fromJson(json['uiElement'])
        : null;
    canClose = json['canClose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockCode'] = this.blockCode;
    data['showType'] = this.showType;
    data['action'] = this.action;
    data['actionType'] = this.actionType;
    if (this.extInfo != null) {
      data['extInfo'] = this.extInfo.toJson();
    }
    if (this.uiElement != null) {
      data['uiElement'] = this.uiElement.toJson();
    }
    data['canClose'] = this.canClose;
    return data;
  }
}

class ExtInfo {
  List<SquareFeedViewDTOList> squareFeedViewDTOList;
  String moduleName;
  String moduleId;
  String orpheusUrl;
  Null alg;
  Null logInfo;

  ExtInfo(
      {this.squareFeedViewDTOList,
        this.moduleName,
        this.moduleId,
        this.orpheusUrl,
        this.alg,
        this.logInfo});

  ExtInfo.fromJson(Map<String, dynamic> json) {
    if (json['squareFeedViewDTOList'] != null) {
      squareFeedViewDTOList = new List<SquareFeedViewDTOList>();
      json['squareFeedViewDTOList'].forEach((v) {
        squareFeedViewDTOList.add(new SquareFeedViewDTOList.fromJson(v));
      });
    }
    moduleName = json['moduleName'];
    moduleId = json['moduleId'];
    orpheusUrl = json['orpheusUrl'];
    alg = json['alg'];
    logInfo = json['log_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.squareFeedViewDTOList != null) {
      data['squareFeedViewDTOList'] =
          this.squareFeedViewDTOList.map((v) => v.toJson()).toList();
    }
    data['moduleName'] = this.moduleName;
    data['moduleId'] = this.moduleId;
    data['orpheusUrl'] = this.orpheusUrl;
    data['alg'] = this.alg;
    data['log_info'] = this.logInfo;
    return data;
  }
}

class SquareFeedViewDTOList {
  String id;
  int type;
  String typeDesc;
  int position;
  Resource resource;
  String alg;
  Null logInfo;
  Null reason;

  SquareFeedViewDTOList(
      {this.id,
        this.type,
        this.typeDesc,
        this.position,
        this.resource,
        this.alg,
        this.logInfo,
        this.reason});

  SquareFeedViewDTOList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    typeDesc = json['typeDesc'];
    position = json['position'];
    resource = json['resource'] != null
        ? new Resource.fromJson(json['resource'])
        : null;
    alg = json['alg'];
    logInfo = json['log_info'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['typeDesc'] = this.typeDesc;
    data['position'] = this.position;
    if (this.resource != null) {
      data['resource'] = this.resource.toJson();
    }
    data['alg'] = this.alg;
    data['log_info'] = this.logInfo;
    data['reason'] = this.reason;
    return data;
  }
}

class Resource {
  MlogBaseData mlogBaseData;
  MlogExt mlogExt;
  MlogExt mlogExtVO;
  UserProfile userProfile;

  Resource({this.mlogBaseData, this.mlogExt, this.mlogExtVO, this.userProfile});

  Resource.fromJson(Map<String, dynamic> json) {
    mlogBaseData = json['mlogBaseData'] != null
        ? new MlogBaseData.fromJson(json['mlogBaseData'])
        : null;
    mlogExt =
    json['mlogExt'] != null ? new MlogExt.fromJson(json['mlogExt']) : null;
    mlogExtVO = json['mlogExtVO'] != null
        ? new MlogExt.fromJson(json['mlogExtVO'])
        : null;
    userProfile = json['userProfile'] != null
        ? new UserProfile.fromJson(json['userProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mlogBaseData != null) {
      data['mlogBaseData'] = this.mlogBaseData.toJson();
    }
    if (this.mlogExt != null) {
      data['mlogExt'] = this.mlogExt.toJson();
    }
    if (this.mlogExtVO != null) {
      data['mlogExtVO'] = this.mlogExtVO.toJson();
    }
    if (this.userProfile != null) {
      data['userProfile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class MlogBaseData {
  String id;
  int type;
  String text;
  String interveneText;
  String coverUrl;
  Null coverDynamicUrl;
  int coverHeight;
  int coverWidth;
  int coverColor;
  Talk talk;
  Null mlogLocation;
  Null mlogLocationDTO;
  Null audio;
  Null audioDTO;

  MlogBaseData(
      {this.id,
        this.type,
        this.text,
        this.interveneText,
        this.coverUrl,
        this.coverDynamicUrl,
        this.coverHeight,
        this.coverWidth,
        this.coverColor,
        this.talk,
        this.mlogLocation,
        this.mlogLocationDTO,
        this.audio,
        this.audioDTO});

  MlogBaseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    text = json['text'];
    interveneText = json['interveneText'];
    coverUrl = json['coverUrl'];
    coverDynamicUrl = json['coverDynamicUrl'];
    coverHeight = json['coverHeight'];
    coverWidth = json['coverWidth'];
    coverColor = json['coverColor'];
    talk = json['talk'] != null ? new Talk.fromJson(json['talk']) : null;
    mlogLocation = json['mlogLocation'];
    mlogLocationDTO = json['mlogLocationDTO'];
    audio = json['audio'];
    audioDTO = json['audioDTO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['text'] = this.text;
    data['interveneText'] = this.interveneText;
    data['coverUrl'] = this.coverUrl;
    data['coverDynamicUrl'] = this.coverDynamicUrl;
    data['coverHeight'] = this.coverHeight;
    data['coverWidth'] = this.coverWidth;
    data['coverColor'] = this.coverColor;
    if (this.talk != null) {
      data['talk'] = this.talk.toJson();
    }
    data['mlogLocation'] = this.mlogLocation;
    data['mlogLocationDTO'] = this.mlogLocationDTO;
    data['audio'] = this.audio;
    data['audioDTO'] = this.audioDTO;
    return data;
  }
}

class Talk {
  int talkId;
  Null talkName;
  String talkDesc;
  Null coverUrl;
  int coverHeight;
  int coverWidth;
  int type;
  int shareCount;
  int follows;
  int participations;
  Null rcmdInfo;
  bool followed;

  Talk(
      {this.talkId,
        this.talkName,
        this.talkDesc,
        this.coverUrl,
        this.coverHeight,
        this.coverWidth,
        this.type,
        this.shareCount,
        this.follows,
        this.participations,
        this.rcmdInfo,
        this.followed});

  Talk.fromJson(Map<String, dynamic> json) {
    talkId = json['talkId'];
    talkName = json['talkName'];
    talkDesc = json['talkDesc'];
    coverUrl = json['coverUrl'];
    coverHeight = json['coverHeight'];
    coverWidth = json['coverWidth'];
    type = json['type'];
    shareCount = json['shareCount'];
    follows = json['follows'];
    participations = json['participations'];
    rcmdInfo = json['rcmdInfo'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['talkId'] = this.talkId;
    data['talkName'] = this.talkName;
    data['talkDesc'] = this.talkDesc;
    data['coverUrl'] = this.coverUrl;
    data['coverHeight'] = this.coverHeight;
    data['coverWidth'] = this.coverWidth;
    data['type'] = this.type;
    data['shareCount'] = this.shareCount;
    data['follows'] = this.follows;
    data['participations'] = this.participations;
    data['rcmdInfo'] = this.rcmdInfo;
    data['followed'] = this.followed;
    return data;
  }
}

class MlogExt {
  int commentCount;
  int likedCount;
  int shareCount;
  Null rcmdInfo;
  Null strongPushMark;
  Null strongPushIcon;

  MlogExt(
      {this.commentCount,
        this.likedCount,
        this.shareCount,
        this.rcmdInfo,
        this.strongPushMark,
        this.strongPushIcon});

  MlogExt.fromJson(Map<String, dynamic> json) {
    commentCount = json['commentCount'];
    likedCount = json['likedCount'];
    shareCount = json['shareCount'];
    rcmdInfo = json['rcmdInfo'];
    strongPushMark = json['strongPushMark'];
    strongPushIcon = json['strongPushIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentCount'] = this.commentCount;
    data['likedCount'] = this.likedCount;
    data['shareCount'] = this.shareCount;
    data['rcmdInfo'] = this.rcmdInfo;
    data['strongPushMark'] = this.strongPushMark;
    data['strongPushIcon'] = this.strongPushIcon;
    return data;
  }
}

class UserProfile {
  int userId;
  String nickname;
  int userType;
  String avatarUrl;
  int gender;
  bool followed;

  UserProfile(
      {this.userId,
        this.nickname,
        this.userType,
        this.avatarUrl,
        this.gender,
        this.followed});

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    userType = json['userType'];
    avatarUrl = json['avatarUrl'];
    gender = json['gender'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['userType'] = this.userType;
    data['avatarUrl'] = this.avatarUrl;
    data['gender'] = this.gender;
    data['followed'] = this.followed;
    return data;
  }
}

class UiElement {
  MainTitle mainTitle;
  MainTitle subTitle;
  Button button;

  UiElement({this.mainTitle, this.subTitle, this.button});

  UiElement.fromJson(Map<String, dynamic> json) {
    mainTitle = json['mainTitle'] != null
        ? new MainTitle.fromJson(json['mainTitle'])
        : null;
    subTitle = json['subTitle'] != null
        ? new MainTitle.fromJson(json['subTitle'])
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
