/*
* Author : LiJiqqi
* Date : 2020/9/27
*/


class UserDetailEntity{
  UserPoint userPoint;
  Profile profile;
  List<Bindings> bindings;

  int level;
  int listenSongs;
  bool mobileSign;
  bool pcSign;
  bool peopleCanSeeMyPlayRecord;
  bool adValid;

  UserDetailEntity.fromJson(Map<String,dynamic> json){
    userPoint = json['userPoint'] != null ? UserPoint.fromJson(json['userPoint']) : null;
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    if(json['bindings'] != null){
      bindings = [];
      json['bindings'].map((j){
        bindings.add(Bindings.fromJson(j));
      });
    }

    level = json['level'] ;
    listenSongs = json['listenSongs'] ;
    mobileSign = json['mobileSign'] ;
    pcSign = json['pcSign'];
    peopleCanSeeMyPlayRecord = json['peopleCanSeeMyPlayRecord'] ;
    adValid = json['adValid'];
  }




}

class UserPoint {
  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;

  UserPoint(
      {this.userId,
        this.balance,
        this.updateTime,
        this.version,
        this.status,
        this.blockBalance});

  UserPoint.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    balance = json['balance'];
    updateTime = json['updateTime'];
    version = json['version'];
    status = json['status'];
    blockBalance = json['blockBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['balance'] = this.balance;
    data['updateTime'] = this.updateTime;
    data['version'] = this.version;
    data['status'] = this.status;
    data['blockBalance'] = this.blockBalance;
    return data;
  }
}

class Profile {
  bool mutual;
  bool followed;
  dynamic remarkName;
  int authStatus;
  String detailDescription;
  int gender;
  int birthday;
  String avatarUrl;

  dynamic expertTags;
  int djStatus;
  int accountStatus;
  int province;
  int city;
  bool defaultAvatar;
  int backgroundImgId;
  String backgroundUrl;
  int avatarImgId;
  String nickname;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  int userId;
  int vipType;
  int userType;
  int createTime;
  String signature;
  int authority;
  int followeds;
  int follows;
  bool blacklist;
  int eventCount;
  int allSubscribedCount;
  int playlistBeSubscribedCount;

  dynamic followTime;
  bool followMe;
  List<dynamic> artistIdentity;
  int cCount;
  int sDJPCount;
  int playlistCount;
  int sCount;
  int newFollows;

  Profile({this.mutual, this.followed, this.remarkName, this.authStatus,
    this.detailDescription, this.gender, this.birthday,
    this.avatarUrl,  this.expertTags, this.djStatus,
    this.accountStatus, this.province, this.city, this.defaultAvatar,
    this.backgroundImgId, this.backgroundUrl, this.avatarImgId, this.nickname,
    this.avatarImgIdStr, this.backgroundImgIdStr, this.description,
    this.userId, this.vipType, this.userType, this.createTime,
    this.signature, this.authority, this.followeds, this.follows,
    this.blacklist, this.eventCount, this.allSubscribedCount,
    this.playlistBeSubscribedCount,  this.followTime,
    this.followMe, this.artistIdentity, this.cCount, this.sDJPCount,
    this.playlistCount, this.sCount, this.newFollows});

  Profile.fromJson(Map<String, dynamic> json) {
    mutual = json['mutual'];
    followed = json['followed'];
    remarkName = json['remarkName'];
    authStatus = json['authStatus'];
    detailDescription = json['detailDescription'];
    gender = json['gender'];
    birthday = json['birthday'];
    avatarUrl = json['avatarUrl'];
    //experts = json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
    expertTags = json['expertTags'];
    djStatus = json['djStatus'];
    accountStatus = json['accountStatus'];
    province = json['province'];
    city = json['city'];
    defaultAvatar = json['defaultAvatar'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    avatarImgId = json['avatarImgId'];
    nickname = json['nickname'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    description = json['description'];
    userId = json['userId'];
    vipType = json['vipType'];
    userType = json['userType'];
    createTime = json['createTime'];
    signature = json['signature'];
    authority = json['authority'];
    followeds = json['followeds'];
    follows = json['follows'];
    blacklist = json['blacklist'];
    eventCount = json['eventCount'];
    allSubscribedCount = json['allSubscribedCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
    avatarImgIdStr = json['avatarImgId_str'];
    followTime = json['followTime'];
    followMe = json['followMe'];
//    if (json['artistIdentity'] != null) {
//      artistIdentity = new List<Null>();
//      json['artistIdentity'].forEach((v) { artistIdentity.add(new Null.fromJson(v)); });
//    }
    cCount = json['cCount'];
    sDJPCount = json['sDJPCount'];
    playlistCount = json['playlistCount'];
    sCount = json['sCount'];
    newFollows = json['newFollows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mutual'] = this.mutual;
    data['followed'] = this.followed;
    data['remarkName'] = this.remarkName;
    data['authStatus'] = this.authStatus;
    data['detailDescription'] = this.detailDescription;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['avatarUrl'] = this.avatarUrl;

    data['expertTags'] = this.expertTags;
    data['djStatus'] = this.djStatus;
    data['accountStatus'] = this.accountStatus;
    data['province'] = this.province;
    data['city'] = this.city;
    data['defaultAvatar'] = this.defaultAvatar;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['avatarImgId'] = this.avatarImgId;
    data['nickname'] = this.nickname;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['vipType'] = this.vipType;
    data['userType'] = this.userType;
    data['createTime'] = this.createTime;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['blacklist'] = this.blacklist;
    data['eventCount'] = this.eventCount;
    data['allSubscribedCount'] = this.allSubscribedCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    data['avatarImgId_str'] = this.avatarImgIdStr;
    data['followTime'] = this.followTime;
    data['followMe'] = this.followMe;
//    if (this.artistIdentity != null) {
//      data['artistIdentity'] = this.artistIdentity.map((v) => v.toJson()).toList();
//    }
    data['cCount'] = this.cCount;
    data['sDJPCount'] = this.sDJPCount;
    data['playlistCount'] = this.playlistCount;
    data['sCount'] = this.sCount;
    data['newFollows'] = this.newFollows;
    return data;
  }
}
class Bindings {
  int expiresIn;
  int refreshTime;
  int bindingTime;
  dynamic tokenJsonStr;
  bool expired;
  String url;
  int userId;
  int id;
  int type;

  Bindings(
      {this.expiresIn,
        this.refreshTime,
        this.bindingTime,
        this.tokenJsonStr,
        this.expired,
        this.url,
        this.userId,
        this.id,
        this.type});

  Bindings.fromJson(Map<String, dynamic> json) {
    expiresIn = json['expiresIn'];
    refreshTime = json['refreshTime'];
    bindingTime = json['bindingTime'];
    tokenJsonStr = json['tokenJsonStr'];
    expired = json['expired'];
    url = json['url'];
    userId = json['userId'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiresIn'] = this.expiresIn;
    data['refreshTime'] = this.refreshTime;
    data['bindingTime'] = this.bindingTime;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['expired'] = this.expired;
    data['url'] = this.url;
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

