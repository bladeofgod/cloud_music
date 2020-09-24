/*
* Author : LiJiqqi
* Date : 2020/9/23
*/

class UserEntity{
  int loginType;
  int code;
  String token;
  Account account;
  Profile profile;
  List<Binding> bindings ;
  String cookie;

  UserEntity.fromJson(Map<String,dynamic> json){
    loginType = json['loginType'];
    code = json['code'];
    token = json['token'];
    cookie = json['cookie'];

    account = json['account'] != null ? Account.fromJson(json['account']) : null;
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    if(json['bindings'] != null){
      bindings = [];
      json['bindings'].forEach((j){
        bindings.add(Binding.fromJson(j));
      });
    }

  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = loginType;
    data['code'] = code;
    data['token'] = token;
    data['cookie'] = cookie;
    if(account != null){
      data['account'] = account.toJson();
    }
    if(profile != null){
      data['profile'] = profile.toJson();
    }
    if(bindings != null){
      data['bindings'] = bindings.map((e) => e.toJson()).toList();
    }
    return data;
  }


}

class Binding {
  int userId;
  String url;
  int refreshTime;
  String tokenJsonStr;
  int expiresIn;
  int bindingTime;
  bool expired;
  int id;
  int type;

  Binding(
      {this.userId,
        this.url,
        this.refreshTime,
        this.tokenJsonStr,
        this.expiresIn,
        this.bindingTime,
        this.expired,
        this.id,
        this.type});

  Binding.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    url = json['url'];
    refreshTime = json['refreshTime'];
    tokenJsonStr = json['tokenJsonStr'];
    expiresIn = json['expiresIn'];
    bindingTime = json['bindingTime'];
    expired = json['expired'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['url'] = this.url;
    data['refreshTime'] = this.refreshTime;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['expiresIn'] = this.expiresIn;
    data['bindingTime'] = this.bindingTime;
    data['expired'] = this.expired;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class Profile {
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  int userId;
  bool followed;
  String backgroundUrl;
  String detailDescription;
  int gender;
  int accountStatus;
  int vipType;
  int avatarImgId;
  String nickname;
  int birthday;
  int city;
  int userType;
  int backgroundImgId;
  String avatarUrl;
  int province;
  bool defaultAvatar;
  int djStatus;

  bool mutual;
  dynamic remarkName;
  dynamic expertTags;
  int authStatus;
  String signature;
  int authority;

  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile({this.avatarImgIdStr, this.backgroundImgIdStr, this.description, this.userId,
    this.followed, this.backgroundUrl, this.detailDescription, this.gender, this.accountStatus,
    this.vipType, this.avatarImgId, this.nickname, this.birthday, this.city, this.userType,
    this.backgroundImgId, this.avatarUrl, this.province, this.defaultAvatar, this.djStatus
    , this.mutual, this.remarkName, this.expertTags, this.authStatus, this.signature, this.authority, this.followeds, this.follows, this.eventCount, this.playlistCount, this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    description = json['description'];
    userId = json['userId'];
    followed = json['followed'];
    backgroundUrl = json['backgroundUrl'];
    detailDescription = json['detailDescription'];
    gender = json['gender'];
    accountStatus = json['accountStatus'];
    vipType = json['vipType'];
    avatarImgId = json['avatarImgId'];
    nickname = json['nickname'];
    birthday = json['birthday'];
    city = json['city'];
    userType = json['userType'];
    backgroundImgId = json['backgroundImgId'];
    avatarUrl = json['avatarUrl'];
    province = json['province'];
    defaultAvatar = json['defaultAvatar'];
    djStatus = json['djStatus'];

    mutual = json['mutual'];
    remarkName = json['remarkName'];
    expertTags = json['expertTags'];
    authStatus = json['authStatus'];
    signature = json['signature'];
    authority = json['authority'];
    avatarImgIdStr = json['avatarImgId_str'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['followed'] = this.followed;
    data['backgroundUrl'] = this.backgroundUrl;
    data['detailDescription'] = this.detailDescription;
    data['gender'] = this.gender;
    data['accountStatus'] = this.accountStatus;
    data['vipType'] = this.vipType;
    data['avatarImgId'] = this.avatarImgId;
    data['nickname'] = this.nickname;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['userType'] = this.userType;
    data['backgroundImgId'] = this.backgroundImgId;
    data['avatarUrl'] = this.avatarUrl;
    data['province'] = this.province;
    data['defaultAvatar'] = this.defaultAvatar;
    data['djStatus'] = this.djStatus;

    data['mutual'] = this.mutual;
    data['remarkName'] = this.remarkName;
    data['expertTags'] = this.expertTags;
    data['authStatus'] = this.authStatus;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['avatarImgId_str'] = this.avatarImgIdStr;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}




class Account {
  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  Account(
      {this.id,
        this.userName,
        this.type,
        this.status,
        this.whitelistAuthority,
        this.createTime,
        this.salt,
        this.tokenVersion,
        this.ban,
        this.baoyueVersion,
        this.donateVersion,
        this.vipType,
        this.viptypeVersion,
        this.anonimousUser});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
    anonimousUser = json['anonimousUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoyueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    data['anonimousUser'] = this.anonimousUser;
    return data;
  }
}






