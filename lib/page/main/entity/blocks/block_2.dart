class Block2 {
  String blockCode;
  String showType;
  UiElement uiElement;
  List<Creatives> creatives;
  bool canClose;

  Block2({this.blockCode, this.showType, this.uiElement, this.creatives, this.canClose});

  Block2.fromJson(Map<String, dynamic> json) {
    blockCode = json['blockCode'];
    showType = json['showType'];
    uiElement = json['uiElement'] != null ? new UiElement.fromJson(json['uiElement']) : null;
    if (json['creatives'] != null) {
      creatives = new List<Creatives>();
      json['creatives'].forEach((v) { creatives.add(new Creatives.fromJson(v)); });
    }
    canClose = json['canClose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockCode'] = this.blockCode;
    data['showType'] = this.showType;
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
  Image image;

  UiElement({this.mainTitle, this.subTitle, this.button});

  UiElement.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    mainTitle = json['mainTitle'] != null ? new MainTitle.fromJson(json['mainTitle']) : null;
    subTitle = json['subTitle'] != null ? new MainTitle.fromJson(json['subTitle']) : null;
    button = json['button'] != null ? new Button.fromJson(json['button']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.image != null){
      data['image'] = image.toJson();
    }
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
  UiElement uiElement;
  List<Resources> resources;
  int position;

  Creatives({this.creativeType, this.uiElement, this.resources, this.position});

  Creatives.fromJson(Map<String, dynamic> json) {
    creativeType = json['creativeType'];
    uiElement = json['uiElement'] != null ? new UiElement.fromJson(json['uiElement']) : null;
    if (json['resources'] != null) {
      resources = new List<Resources>();
      json['resources'].forEach((v) { resources.add(new Resources.fromJson(v)); });
    }
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creativeType'] = this.creativeType;
    if (this.uiElement != null) {
      data['uiElement'] = this.uiElement.toJson();
    }
    if (this.resources != null) {
      data['resources'] = this.resources.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    return data;
  }
}



class Resources {
  UiElement uiElement;
  String resourceType;
  String resourceId;
  dynamic resourceUrl;
  ResourceExtInfo resourceExtInfo;
  String action;
  String actionType;
  bool valid;
  String alg;
  String logInfo;

  Resources({this.uiElement, this.resourceType, this.resourceId, this.resourceUrl, this.resourceExtInfo, this.action, this.actionType, this.valid, this.alg, this.logInfo});

  Resources.fromJson(Map<String, dynamic> json) {
    uiElement = json['uiElement'] != null ? new UiElement.fromJson(json['uiElement']) : null;
    resourceType = json['resourceType'];
    resourceId = json['resourceId'];
    resourceUrl = json['resourceUrl'];
    resourceExtInfo = json['resourceExtInfo'] != null ? new ResourceExtInfo.fromJson(json['resourceExtInfo']) : null;
    action = json['action'];
    actionType = json['actionType'];
    valid = json['valid'];
    alg = json['alg'];
    logInfo = json['logInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uiElement != null) {
      data['uiElement'] = this.uiElement.toJson();
    }
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


class SubTitle {
  String title;
  String titleType;

  SubTitle({this.title, this.titleType});

  SubTitle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleType = json['titleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['titleType'] = this.titleType;
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

class ResourceExtInfo {
  List<Artists> artists;
  SongData songData;
  SongPrivilege songPrivilege;
  CommentSimpleData commentSimpleData;

  ResourceExtInfo({this.artists, this.songData, this.songPrivilege, this.commentSimpleData});

  ResourceExtInfo.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    songData = json['songData'] != null ? new SongData.fromJson(json['songData']) : null;
    songPrivilege = json['songPrivilege'] != null ? new SongPrivilege.fromJson(json['songPrivilege']) : null;
    commentSimpleData = json['commentSimpleData'] != null ? new CommentSimpleData.fromJson(json['commentSimpleData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.songData != null) {
      data['songData'] = this.songData.toJson();
    }
    if (this.songPrivilege != null) {
      data['songPrivilege'] = this.songPrivilege.toJson();
    }
    if (this.commentSimpleData != null) {
      data['commentSimpleData'] = this.commentSimpleData.toJson();
    }
    return data;
  }
}

class Artists {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<dynamic> alias;
  String trans;
  int musicSize;
  int topicPerson;

  Artists({this.name, this.id, this.picId, this.img1v1Id, this.briefDesc, this.picUrl, this.img1v1Url, this.albumSize, this.alias, this.trans, this.musicSize, this.topicPerson});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
//    if (json['alias'] != null) {
//      alias = new List<dynamic>();
//      json['alias'].forEach((v) { alias.add(new dynamic.fromJson(v)); });
//    }
    trans = json['trans'];
    musicSize = json['musicSize'];
    topicPerson = json['topicPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    if (this.alias != null) {
      data['alias'] = this.alias.map((v) => v.toJson()).toList();
    }
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    data['topicPerson'] = this.topicPerson;
    return data;
  }
}

class SongData {
  String name;
  int id;
  int position;
  List<String> alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  dynamic crbt;
  dynamic audition;
  String copyFrom;
  String commentThreadId;
  dynamic rtUrl;
  int ftype;
  List<dynamic> rtUrls;
  int copyright;
  dynamic transName;
  dynamic sign;
  int mark;
  int mvid;
  HMusic hMusic;
  HMusic mMusic;
  HMusic lMusic;
  HMusic bMusic;
  dynamic mp3Url;
  int rtype;
  dynamic rurl;

  SongData({this.name, this.id, this.position, this.alias, this.status, this.fee, this.copyrightId, this.disc, this.no, this.artists, this.album, this.starred, this.popularity, this.score, this.starredNum, this.duration, this.playedNum, this.dayPlays, this.hearTime, this.ringtone, this.crbt, this.audition, this.copyFrom, this.commentThreadId, this.rtUrl, this.ftype, this.rtUrls, this.copyright, this.transName, this.sign, this.mark, this.mvid, this.hMusic, this.mMusic, this.lMusic, this.bMusic, this.mp3Url, this.rtype, this.rurl});

  SongData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    position = json['position'];
    alias = json['alias'].cast<String>();
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];
    ringtone = json['ringtone'];
    crbt = json['crbt'];
    audition = json['audition'];
    copyFrom = json['copyFrom'];
    commentThreadId = json['commentThreadId'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
//    if (json['rtUrls'] != null) {
//      rtUrls = new List<dynamic>();
//      json['rtUrls'].forEach((v) { rtUrls.add(new dynamic.fromJson(v)); });
//    }
    copyright = json['copyright'];
    transName = json['transName'];
    sign = json['sign'];
    mark = json['mark'];
    mvid = json['mvid'];
    hMusic = json['hMusic'] != null ? new HMusic.fromJson(json['hMusic']) : null;
    mMusic = json['mMusic'] != null ? new HMusic.fromJson(json['mMusic']) : null;
    lMusic = json['lMusic'] != null ? new HMusic.fromJson(json['lMusic']) : null;
    bMusic = json['bMusic'] != null ? new HMusic.fromJson(json['bMusic']) : null;
    mp3Url = json['mp3Url'];
    rtype = json['rtype'];
    rurl = json['rurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['position'] = this.position;
    data['alias'] = this.alias;
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    data['ringtone'] = this.ringtone;
    data['crbt'] = this.crbt;
    data['audition'] = this.audition;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
//    if (this.rtUrls != null) {
//      data['rtUrls'] = this.rtUrls.map((v) => v.toJson()).toList();
//    }
    data['copyright'] = this.copyright;
    data['transName'] = this.transName;
    data['sign'] = this.sign;
    data['mark'] = this.mark;
    data['mvid'] = this.mvid;
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic.toJson();
    }
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic.toJson();
    }
    data['mp3Url'] = this.mp3Url;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    return data;
  }
}

class Album {
  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  String company;
  String briefDesc;
  Artists artist;
  List<dynamic> songs;
  List<String> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  dynamic transName;
  int mark;
  String picIdStr;

  Album({this.name, this.id, this.type, this.size, this.picId, this.blurPicUrl, this.companyId, this.pic, this.picUrl, this.publishTime, this.description, this.tags, this.company, this.briefDesc, this.artist, this.songs, this.alias, this.status, this.copyrightId, this.commentThreadId, this.artists, this.subType, this.transName, this.mark, this.picIdStr});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picId = json['picId'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    publishTime = json['publishTime'];
    description = json['description'];
    tags = json['tags'];
    company = json['company'];
    briefDesc = json['briefDesc'];
    artist = json['artist'] != null ? new Artists.fromJson(json['artist']) : null;
//    if (json['songs'] != null) {
//      songs = new List<dynamic>();
//      json['songs'].forEach((v) { songs.add(new dynamic.fromJson(v)); });
//    }
    alias = json['alias'].cast<String>();
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    subType = json['subType'];
    transName = json['transName'];
    mark = json['mark'];
    picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId'] = this.picId;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['publishTime'] = this.publishTime;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
//    if (this.songs != null) {
//      data['songs'] = this.songs.map((v) => v.toJson()).toList();
//    }
    data['alias'] = this.alias;
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['transName'] = this.transName;
    data['mark'] = this.mark;
    data['picId_str'] = this.picIdStr;
    return data;
  }
}

class HMusic {
  dynamic name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  int volumeDelta;

  HMusic({this.name, this.id, this.size, this.extension, this.sr, this.dfsId, this.bitrate, this.playTime, this.volumeDelta});

  HMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class SongPrivilege {
  int id;
  int fee;
  int payed;
  int realPayed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  dynamic pc;
  bool toast;
  int flag;
  bool paidBigBang;
  bool preSell;

  SongPrivilege({this.id, this.fee, this.payed, this.realPayed, this.st, this.pl, this.dl, this.sp, this.cp, this.subp, this.cs, this.maxbr, this.fl, this.pc, this.toast, this.flag, this.paidBigBang, this.preSell});

  SongPrivilege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    realPayed = json['realPayed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    pc = json['pc'];
    toast = json['toast'];
    flag = json['flag'];
    paidBigBang = json['paidBigBang'];
    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['realPayed'] = this.realPayed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['pc'] = this.pc;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['paidBigBang'] = this.paidBigBang;
    data['preSell'] = this.preSell;
    return data;
  }
}

class CommentSimpleData {
  String content;
  int commentId;
  dynamic threadId;
  int userId;
  dynamic userName;

  CommentSimpleData({this.content, this.commentId, this.threadId, this.userId, this.userName});

  CommentSimpleData.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    commentId = json['commentId'];
    threadId = json['threadId'];
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['commentId'] = this.commentId;
    data['threadId'] = this.threadId;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}







