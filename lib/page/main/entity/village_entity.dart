/*
* Author : LiJiqqi
* Date : 2020/9/23
*/

class VillagePageEntity{
  List<VillageEntity> list;
  VillagePageEntity.fromJson(Map<String,dynamic> json){
    if(json['data'] != null){
      list = [];
      json['data'].forEach((e){
        list.add(VillageEntity.fromJson(e));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(list != null){
      data['data'] = list.map((e) => e.toJson()).toList();
    }
  }
}
class VillageEntity {
  int id;
  String threadId;
  String content;
  int time;
  SimpleUserInfo simpleUserInfo;
  int likedCount;
  int replyCount;
  SimpleResourceInfo simpleResourceInfo;
  bool liked;

  VillageEntity(
      {this.id,
        this.threadId,
        this.content,
        this.time,
        this.simpleUserInfo,
        this.likedCount,
        this.replyCount,
        this.simpleResourceInfo,
        this.liked});

  VillageEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    threadId = json['threadId'];
    content = json['content'];
    time = json['time'];
    simpleUserInfo = json['simpleUserInfo'] != null
        ? new SimpleUserInfo.fromJson(json['simpleUserInfo'])
        : null;
    likedCount = json['likedCount'];
    replyCount = json['replyCount'];
    simpleResourceInfo = json['simpleResourceInfo'] != null
        ? new SimpleResourceInfo.fromJson(json['simpleResourceInfo'])
        : null;
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['threadId'] = this.threadId;
    data['content'] = this.content;
    data['time'] = this.time;
    if (this.simpleUserInfo != null) {
      data['simpleUserInfo'] = this.simpleUserInfo.toJson();
    }
    data['likedCount'] = this.likedCount;
    data['replyCount'] = this.replyCount;
    if (this.simpleResourceInfo != null) {
      data['simpleResourceInfo'] = this.simpleResourceInfo.toJson();
    }
    data['liked'] = this.liked;
    return data;
  }
}

class SimpleUserInfo {
  int userId;
  String nickname;
  String avatar;
  bool followed;
  int userType;

  SimpleUserInfo(
      {this.userId, this.nickname, this.avatar, this.followed, this.userType});

  SimpleUserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    followed = json['followed'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['followed'] = this.followed;
    data['userType'] = this.userType;
    return data;
  }
}

class SimpleResourceInfo {
  int songId;
  String threadId;
  String name;
  List<Artists> artists;
  String songCoverUrl;
  Song song;
  Privilege privilege;

  SimpleResourceInfo(
      {this.songId,
        this.threadId,
        this.name,
        this.artists,
        this.songCoverUrl,
        this.song,
        this.privilege});

  SimpleResourceInfo.fromJson(Map<String, dynamic> json) {
    songId = json['songId'];
    threadId = json['threadId'];
    name = json['name'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    songCoverUrl = json['songCoverUrl'];
    song = json['song'] != null ? new Song.fromJson(json['song']) : null;
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['songId'] = this.songId;
    data['threadId'] = this.threadId;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['songCoverUrl'] = this.songCoverUrl;
    if (this.song != null) {
      data['song'] = this.song.toJson();
    }
    if (this.privilege != null) {
      data['privilege'] = this.privilege.toJson();
    }
    return data;
  }
}

class Artists {
  int id;
  String name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Song {
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
  int mv;
  dynamic rurl;
  int rtype;
  int mst;
  int cp;
  int publishTime;

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
        this.mv,
        this.rurl,
        this.rtype,
        this.mst,
        this.cp,
        this.publishTime});

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
    mv = json['mv'];
    rurl = json['rurl'];
    rtype = json['rtype'];
    mst = json['mst'];
    cp = json['cp'];
    publishTime = json['publishTime'];
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
    data['mv'] = this.mv;
    data['rurl'] = this.rurl;
    data['rtype'] = this.rtype;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['publishTime'] = this.publishTime;
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
  int pic;

  Al({this.id, this.name, this.picUrl, this.tns, this.pic});

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
