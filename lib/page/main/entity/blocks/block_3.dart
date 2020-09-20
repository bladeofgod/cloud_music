class Block3 {
  String blockCode;
  String showType;
  String action;
  String actionType;
  UiElement uiElement;
  List<Creatives> creatives;
  bool canClose;

  Block3(
      {this.blockCode,
        this.showType,
        this.action,
        this.actionType,
        this.uiElement,
        this.creatives,
        this.canClose});

  Block3.fromJson(Map<String, dynamic> json) {
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
  Null uiElement;
  String resourceType;
  String resourceId;
  Null resourceUrl;
  ResourceExtInfo resourceExtInfo;
  Null action;
  Null actionType;
  bool valid;
  Null alg;
  Null logInfo;

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
