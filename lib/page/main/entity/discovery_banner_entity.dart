/*
* Author : LiJiqqi
* Date : 2020/9/15
*/


class DiscoveryBannerEntity {
  String pic;
  int targetId;
  dynamic adid;
  int targetType;
  String titleColor;
  String typeTitle;
  dynamic url;
  dynamic adurlV2;
  bool exclusive;
  dynamic monitorImpress;
  dynamic monitorClick;
  dynamic monitorType;
  List<dynamic> monitorImpressList;
  List<dynamic> monitorClickList;
  dynamic monitorBlackList;
  dynamic extMonitor;
  dynamic extMonitorInfo;
  dynamic adSource;
  dynamic adLocation;
  String encodeId;
  dynamic program;
  dynamic event;
  dynamic video;
  dynamic dynamicVideoData;
  Song song;
  String bannerId;
  dynamic alg;
  String scm;
  String requestId;
  bool showAdTag;
  dynamic pid;
  dynamic showContext;
  dynamic adDispatchJson;

  DiscoveryBannerEntity(
      {this.pic,
        this.targetId,
        this.adid,
        this.targetType,
        this.titleColor,
        this.typeTitle,
        this.url,
        this.adurlV2,
        this.exclusive,
        this.monitorImpress,
        this.monitorClick,
        this.monitorType,
        this.monitorImpressList,
        this.monitorClickList,
        this.monitorBlackList,
        this.extMonitor,
        this.extMonitorInfo,
        this.adSource,
        this.adLocation,
        this.encodeId,
        this.program,
        this.event,
        this.video,
        this.dynamicVideoData,
        this.song,
        this.bannerId,
        this.alg,
        this.scm,
        this.requestId,
        this.showAdTag,
        this.pid,
        this.showContext,
        this.adDispatchJson});

  DiscoveryBannerEntity.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    targetId = json['targetId'];
    adid = json['adid'];
    targetType = json['targetType'];
    titleColor = json['titleColor'];
    typeTitle = json['typeTitle'];
    url = json['url'];
    adurlV2 = json['adurlV2'];
    exclusive = json['exclusive'];
    monitorImpress = json['monitorImpress'];
    monitorClick = json['monitorClick'];
    monitorType = json['monitorType'];
//    if (json['monitorImpressList'] != null) {
//      monitorImpressList = new List<dynamic>();
//      if(monitorImpressList.single == null) return;
//      json['monitorImpressList'].forEach((v) {
//        monitorImpressList.add(new dynamic.fromJson(v));
//      });
//    }
//    if (json['monitorClickList'] != null) {
//      monitorClickList = new List<dynamic>();
//      json['monitorClickList'].forEach((v) {
//        monitorClickList.add(new dynamic.fromJson(v));
//      });
//    }
    monitorBlackList = json['monitorBlackList'];
    extMonitor = json['extMonitor'];
    extMonitorInfo = json['extMonitorInfo'];
    adSource = json['adSource'];
    adLocation = json['adLocation'];
    encodeId = json['encodeId'];
    program = json['program'];
    event = json['event'];
    video = json['video'];
    dynamicVideoData = json['dynamicVideoData'];
    song = json['song'] != null ? new Song.fromJson(json['song']) : null;
    bannerId = json['bannerId'];
    alg = json['alg'];
    scm = json['scm'];
    requestId = json['requestId'];
    showAdTag = json['showAdTag'];
    pid = json['pid'];
    showContext = json['showContext'];
    adDispatchJson = json['adDispatchJson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['targetId'] = this.targetId;
    data['adid'] = this.adid;
    data['targetType'] = this.targetType;
    data['titleColor'] = this.titleColor;
    data['typeTitle'] = this.typeTitle;
    data['url'] = this.url;
    data['adurlV2'] = this.adurlV2;
    data['exclusive'] = this.exclusive;
    data['monitorImpress'] = this.monitorImpress;
    data['monitorClick'] = this.monitorClick;
    data['monitorType'] = this.monitorType;
//    if (this.monitorImpressList != null) {
//      data['monitorImpressList'] =
//          this.monitorImpressList.map((v) => v.toJson()).toList();
//    }
//    if (this.monitorClickList != null) {
//      data['monitorClickList'] =
//          this.monitorClickList.map((v) => v.toJson()).toList();
//    }
    data['monitorBlackList'] = this.monitorBlackList;
    data['extMonitor'] = this.extMonitor;
    data['extMonitorInfo'] = this.extMonitorInfo;
    data['adSource'] = this.adSource;
    data['adLocation'] = this.adLocation;
    data['encodeId'] = this.encodeId;
    data['program'] = this.program;
    data['event'] = this.event;
    data['video'] = this.video;
    data['dynamicVideoData'] = this.dynamicVideoData;
    if (this.song != null) {
      data['song'] = this.song.toJson();
    }
    data['bannerId'] = this.bannerId;
    data['alg'] = this.alg;
    data['scm'] = this.scm;
    data['requestId'] = this.requestId;
    data['showAdTag'] = this.showAdTag;
    data['pid'] = this.pid;
    data['showContext'] = this.showContext;
    data['adDispatchJson'] = this.adDispatchJson;
    return data;
  }
}

class Song {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<String> alia;
  int pop;
  int st;
  String rt;
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
  int mark;
  int originCoverType;
  dynamic noCopyrightRcmd;
  int rtype;
  dynamic rurl;
  int mst;
  int cp;
  int mv;
  int publishTime;
  Privilege privilege;

  Song(
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
        this.mark,
        this.originCoverType,
        this.noCopyrightRcmd,
        this.rtype,
        this.rurl,
        this.mst,
        this.cp,
        this.mv,
        this.publishTime,
        this.privilege});

  Song.fromJson(Map<String, dynamic> json) {
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
    alia = json['alia'].cast<String>();
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
    mark = json['mark'];
    originCoverType = json['originCoverType'];
    noCopyrightRcmd = json['noCopyrightRcmd'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
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
    data['alia'] = this.alia;
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
    data['mark'] = this.mark;
    data['originCoverType'] = this.originCoverType;
    data['noCopyrightRcmd'] = this.noCopyrightRcmd;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
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




















