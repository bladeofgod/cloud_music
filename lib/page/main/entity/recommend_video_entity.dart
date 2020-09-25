/*
* Author : LiJiqqi
* Date : 2020/9/25
*/
class RecommendVideoEntity {
  int type;
  bool displayed;
  String alg;
  dynamic extAlg;
  Data data;

  RecommendVideoEntity(
      {this.type, this.displayed, this.alg, this.extAlg, this.data});

  RecommendVideoEntity.fromJson(Map<String, dynamic> json) {
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
  dynamic description;
  int commentCount;
  int shareCount;
  List<Resolutions> resolutions;
  Creator creator;
  UrlInfo urlInfo;
  List<VideoGroup> videoGroup;
  dynamic previewUrl;
  int previewDurationms;
  bool hasRelatedGameAd;
  dynamic markTypes;
  List<RelateSong> relateSong;
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
    urlInfo =
    json['urlInfo'] != null ? new UrlInfo.fromJson(json['urlInfo']) : null;
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
    if (json['relateSong'] != null) {
      relateSong = new List<RelateSong>();
      json['relateSong'].forEach((v) {
        relateSong.add(new RelateSong.fromJson(v));
      });
    }
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
    if (this.urlInfo != null) {
      data['urlInfo'] = this.urlInfo.toJson();
    }
    if (this.videoGroup != null) {
      data['videoGroup'] = this.videoGroup.map((v) => v.toJson()).toList();
    }
    data['previewUrl'] = this.previewUrl;
    data['previewDurationms'] = this.previewDurationms;
    data['hasRelatedGameAd'] = this.hasRelatedGameAd;
    data['markTypes'] = this.markTypes;
    if (this.relateSong != null) {
      data['relateSong'] = this.relateSong.map((v) => v.toJson()).toList();
    }
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

class UrlInfo {
  String id;
  String url;
  int size;
  int validityTime;
  bool needPay;
  dynamic payInfo;
  int r;

  UrlInfo(
      {this.id,
        this.url,
        this.size,
        this.validityTime,
        this.needPay,
        this.payInfo,
        this.r});

  UrlInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    size = json['size'];
    validityTime = json['validityTime'];
    needPay = json['needPay'];
    payInfo = json['payInfo'];
    r = json['r'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['size'] = this.size;
    data['validityTime'] = this.validityTime;
    data['needPay'] = this.needPay;
    data['payInfo'] = this.payInfo;
    data['r'] = this.r;
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

class RelateSong {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<dynamic> alia;
  int pop;
  int st;
  dynamic rt;
  int fee;
  int v;
  dynamic crbt;
  String cf;
  Al al;
  int dt;
  H h;
  H m;
  H l;
  dynamic a;
  String cd;
  int no;
  dynamic rtUrl;
  int ftype;
  List<dynamic> rtUrls;
  int djId;
  int copyright;
  int sId;
  int mst;
  int cp;
  int mv;
  int rtype;
  dynamic rurl;
  int publishTime;
  Privilege privilege;

  RelateSong(
      {this.name,
        this.id,
        this.pst,
        this.t,
        this.ar,
        this.alia,
        this.pop,
        this.st,
        this.rt,
        this.fee,
        this.v,
        this.crbt,
        this.cf,
        this.al,
        this.dt,
        this.h,
        this.m,
        this.l,
        this.a,
        this.cd,
        this.no,
        this.rtUrl,
        this.ftype,
        this.rtUrls,
        this.djId,
        this.copyright,
        this.sId,
        this.mst,
        this.cp,
        this.mv,
        this.rtype,
        this.rurl,
        this.publishTime,
        this.privilege});

  RelateSong.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      json['ar'].forEach((v) {
        ar.add(new Ar.fromJson(v));
      });
    }
//    if (json['alia'] != null) {
//      alia = new List<dynamic>();
//      json['alia'].forEach((v) {
//        alia.add(new dynamic.fromJson(v));
//      });
//    }
    pop = json['pop'];
    st = json['st'];
    rt = json['rt'];
    fee = json['fee'];
    v = json['v'];
    crbt = json['crbt'];
    cf = json['cf'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    dt = json['dt'];
    h = json['h'] != null ? new H.fromJson(json['h']) : null;
    m = json['m'] != null ? new H.fromJson(json['m']) : null;
    l = json['l'] != null ? new H.fromJson(json['l']) : null;
    a = json['a'];
    cd = json['cd'];
    no = json['no'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
//    if (json['rtUrls'] != null) {
//      rtUrls = new List<dynamic>();
//      json['rtUrls'].forEach((v) {
//        rtUrls.add(new dynamic.fromJson(v));
//      });
//    }
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    publishTime = json['publishTime'];
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pst'] = this.pst;
    data['t'] = this.t;
    if (this.ar != null) {
      data['ar'] = this.ar.map((v) => v.toJson()).toList();
    }
//    if (this.alia != null) {
//      data['alia'] = this.alia.map((v) => v.toJson()).toList();
//    }
    data['pop'] = this.pop;
    data['st'] = this.st;
    data['rt'] = this.rt;
    data['fee'] = this.fee;
    data['v'] = this.v;
    data['crbt'] = this.crbt;
    data['cf'] = this.cf;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
    data['dt'] = this.dt;
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.m != null) {
      data['m'] = this.m.toJson();
    }
    if (this.l != null) {
      data['l'] = this.l.toJson();
    }
    data['a'] = this.a;
    data['cd'] = this.cd;
    data['no'] = this.no;
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
//    if (this.rtUrls != null) {
//      data['rtUrls'] = this.rtUrls.map((v) => v.toJson()).toList();
//    }
    data['djId'] = this.djId;
    data['copyright'] = this.copyright;
    data['s_id'] = this.sId;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['publishTime'] = this.publishTime;
    if (this.privilege != null) {
      data['privilege'] = this.privilege.toJson();
    }
    return data;
  }
}

class Ar {
  int id;
  String name;
  List<dynamic> tns;
  List<dynamic> alias;

  Ar({this.id, this.name, this.tns, this.alias});

  Ar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
//    if (json['tns'] != null) {
//      tns = new List<dynamic>();
//      json['tns'].forEach((v) {
//        tns.add(new dynamic.fromJson(v));
//      });
//    }
//    if (json['alias'] != null) {
//      alias = new List<dynamic>();
//      json['alias'].forEach((v) {
//        alias.add(new dynamic.fromJson(v));
//      });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
//    if (this.tns != null) {
//      data['tns'] = this.tns.map((v) => v.toJson()).toList();
//    }
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

class Al {
  int id;
  String name;
  String picUrl;
  List<dynamic> tns;
  String picStr;
  int pic;

  Al({this.id, this.name, this.picUrl, this.tns, this.picStr, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
//    if (json['tns'] != null) {
//      tns = new List<dynamic>();
//      json['tns'].forEach((v) {
//        tns.add(new dynamic.fromJson(v));
//      });
//    }
    picStr = json['pic_str'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
//    if (this.tns != null) {
//      data['tns'] = this.tns.map((v) => v.toJson()).toList();
//    }
    data['pic_str'] = this.picStr;
    data['pic'] = this.pic;
    return data;
  }
}

class H {
  int br;
  int fid;
  int size;
  int vd;

  H({this.br, this.fid, this.size, this.vd});

  H.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privilege(
      {this.id,
        this.fee,
        this.payed,
        this.st,
        this.pl,
        this.dl,
        this.sp,
        this.cp,
        this.subp,
        this.cs,
        this.maxbr,
        this.fl,
        this.toast,
        this.flag,
        this.preSell});

  Privilege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    return data;
  }
}
