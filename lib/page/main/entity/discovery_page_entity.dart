/*
* Author : LiJiqqi
* Date : 2020/9/16
*/
class DiscoveryPageEntity {
  dynamic cursor;
  List<Blocks> blocks;
  bool hasMore;
  dynamic blockUUIDs;
  PageConfig pageConfig;
  GuideToast guideToast;

  DiscoveryPageEntity(
      {this.cursor,
        this.blocks,
        this.hasMore,
        this.blockUUIDs,
        this.pageConfig,
        this.guideToast});

  DiscoveryPageEntity.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    if (json['blocks'] != null) {
      blocks = new List<Blocks>();
      json['blocks'].forEach((v) {
        blocks.add(new Blocks.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    blockUUIDs = json['blockUUIDs'];
    pageConfig = json['pageConfig'] != null
        ? new PageConfig.fromJson(json['pageConfig'])
        : null;
    guideToast = json['guideToast'] != null
        ? new GuideToast.fromJson(json['guideToast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    if (this.blocks != null) {
      data['blocks'] = this.blocks.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this.hasMore;
    data['blockUUIDs'] = this.blockUUIDs;
    if (this.pageConfig != null) {
      data['pageConfig'] = this.pageConfig.toJson();
    }
    if (this.guideToast != null) {
      data['guideToast'] = this.guideToast.toJson();
    }
    return data;
  }
}

class Blocks {
  String blockCode;
  String showType;
  String action;
  String actionType;
  UiElement uiElement;
  List<Creatives> creatives;
  bool canClose;

  Blocks(
      {this.blockCode,
        this.showType,
        this.action,
        this.actionType,
        this.uiElement,
        this.creatives,
        this.canClose});

  Blocks.fromJson(Map<String, dynamic> json) {
    blockCode = json['blockCode'];
    showType = json['showType'];
    action = json['action'];
    actionType = json['actionType'];
    uiElement = json['uiElement'] != null
        ? new UiElement.fromJson(json['uiElement'])
        : null;
    if (json['creatives'] != null) {
      creatives = new List<Creatives>();
      json['creatives'].forEach((v) {
        creatives.add(new Creatives.fromJson(v));
      });
    }
    canClose = json['canClose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockCode'] = this.blockCode;
    data['showType'] = this.showType;
    data['action'] = this.action;
    data['actionType'] = this.actionType;
    if (this.uiElement != null) {
      data['uiElement'] = this.uiElement.toJson();
    }
    if (this.creatives != null) {
      data['creatives'] = this.creatives.map((v) => v.toJson()).toList();
    }
    data['canClose'] = this.canClose;
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
  dynamic iconUrl;

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

class Creatives {
  String creativeType;
  String creativeId;
  String action;
  String actionType;
  UiElement uiElement;
  List<Resources> resources;
  String alg;
  int position;
  String logInfo;

  Creatives(
      {this.creativeType,
        this.creativeId,
        this.action,
        this.actionType,
        this.uiElement,
        this.resources,
        this.alg,
        this.position,
        this.logInfo});

  Creatives.fromJson(Map<String, dynamic> json) {
    creativeType = json['creativeType'];
    creativeId = json['creativeId'];
    action = json['action'];
    actionType = json['actionType'];
    uiElement = json['uiElement'] != null
        ? new UiElement.fromJson(json['uiElement'])
        : null;
    if (json['resources'] != null) {
      resources = new List<Resources>();
      json['resources'].forEach((v) {
        resources.add(new Resources.fromJson(v));
      });
    }
    alg = json['alg'];
    position = json['position'];
    logInfo = json['logInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creativeType'] = this.creativeType;
    data['creativeId'] = this.creativeId;
    data['action'] = this.action;
    data['actionType'] = this.actionType;
    if (this.uiElement != null) {
      data['uiElement'] = this.uiElement.toJson();
    }
    if (this.resources != null) {
      data['resources'] = this.resources.map((v) => v.toJson()).toList();
    }
    data['alg'] = this.alg;
    data['position'] = this.position;
    data['logInfo'] = this.logInfo;
    return data;
  }
}

class UiElement {
  MainTitle mainTitle;
  Image image;
  List<String> labelTexts;
  MainTitle subTitle;

  UiElement({this.mainTitle, this.image, this.labelTexts, this.subTitle});

  UiElement.fromJson(Map<String, dynamic> json) {
    mainTitle = json['mainTitle'] != null
        ? new MainTitle.fromJson(json['mainTitle'])
        : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    labelTexts = json['labelTexts']?.cast<String>();
    subTitle = json['subTitle'] != null
        ? new MainTitle.fromJson(json['subTitle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainTitle != null) {
      data['mainTitle'] = this.mainTitle.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['labelTexts'] = this.labelTexts;
    if (this.subTitle != null) {
      data['subTitle'] = this.subTitle.toJson();
    }
    return data;
  }
}

class Image {
  String imageUrl;

  Image({this.imageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class Resources {
  dynamic uiElement;
  String resourceType;
  String resourceId;
  dynamic resourceUrl;
  ResourceExtInfo resourceExtInfo;
  dynamic action;
  dynamic actionType;
  bool valid;
  dynamic alg;
  dynamic logInfo;

  Resources(
      {this.uiElement,
        this.resourceType,
        this.resourceId,
        this.resourceUrl,
        this.resourceExtInfo,
        this.action,
        this.actionType,
        this.valid,
        this.alg,
        this.logInfo});

  Resources.fromJson(Map<String, dynamic> json) {
    uiElement = json['uiElement'];
    resourceType = json['resourceType'];
    resourceId = json['resourceId'];
    resourceUrl = json['resourceUrl'];
    resourceExtInfo = json['resourceExtInfo'] != null
        ? new ResourceExtInfo.fromJson(json['resourceExtInfo'])
        : null;
    action = json['action'];
    actionType = json['actionType'];
    valid = json['valid'];
    alg = json['alg'];
    logInfo = json['logInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uiElement'] = this.uiElement;
    data['resourceType'] = this.resourceType;
    data['resourceId'] = this.resourceId;
    data['resourceUrl'] = this.resourceUrl;
    if (this.resourceExtInfo != null) {
      data['resourceExtInfo'] = this.resourceExtInfo.toJson();
    }
    data['action'] = this.action;
    data['actionType'] = this.actionType;
    data['valid'] = this.valid;
    data['alg'] = this.alg;
    data['logInfo'] = this.logInfo;
    return data;
  }
}

class ResourceExtInfo {
  int playCount;
  bool highQuality;

  ResourceExtInfo({this.playCount, this.highQuality});

  ResourceExtInfo.fromJson(Map<String, dynamic> json) {
    playCount = json['playCount'];
    highQuality = json['highQuality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playCount'] = this.playCount;
    data['highQuality'] = this.highQuality;
    return data;
  }
}

class PageConfig {
  String refreshToast;
  String nodataToast;
  int refreshInterval;
  dynamic title;
  bool fullscreen;
  List<String> abtest;
  List<String> songLabelMarkPriority;
  int songLabelMarkLimit;

  PageConfig(
      {this.refreshToast,
        this.nodataToast,
        this.refreshInterval,
        this.title,
        this.fullscreen,
        this.abtest,
        this.songLabelMarkPriority,
        this.songLabelMarkLimit});

  PageConfig.fromJson(Map<String, dynamic> json) {
    refreshToast = json['refreshToast'];
    nodataToast = json['nodataToast'];
    refreshInterval = json['refreshInterval'];
    title = json['title'];
    fullscreen = json['fullscreen'];
    abtest = json['abtest'].cast<String>();
    songLabelMarkPriority = json['songLabelMarkPriority'].cast<String>();
    songLabelMarkLimit = json['songLabelMarkLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToast'] = this.refreshToast;
    data['nodataToast'] = this.nodataToast;
    data['refreshInterval'] = this.refreshInterval;
    data['title'] = this.title;
    data['fullscreen'] = this.fullscreen;
    data['abtest'] = this.abtest;
    data['songLabelMarkPriority'] = this.songLabelMarkPriority;
    data['songLabelMarkLimit'] = this.songLabelMarkLimit;
    return data;
  }
}

class GuideToast {
  bool hasGuideToast;
  List<dynamic> toastList;

  GuideToast({this.hasGuideToast, this.toastList});

  GuideToast.fromJson(Map<String, dynamic> json) {
    hasGuideToast = json['hasGuideToast'];
//    if (json['toastList'] != null) {
//      toastList = new List<dynamic>();
//      json['toastList'].forEach((v) {
//        toastList.add(new dynamic.fromJson(v));
//      });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasGuideToast'] = this.hasGuideToast;
    if (this.toastList != null) {
      data['toastList'] = this.toastList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
