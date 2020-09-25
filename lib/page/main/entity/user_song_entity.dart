/*
* Author : LiJiqqi
* Date : 2020/9/25
*/
class UserSongEntity {
  List<dynamic> subscribers;
  bool subscribed;
  Creator creator;
  dynamic artists;
  dynamic tracks;
  dynamic updateFrequency;
  int backgroundCoverId;
  dynamic backgroundCoverUrl;
  int titleImage;
  dynamic titleImageUrl;
  dynamic englishTitle;
  bool opRecommend;
  dynamic recommendInfo;
  int adType;
  int trackNumberUpdateTime;
  int userId;
  int createTime;
  bool highQuality;
  int coverImgId;
  int updateTime;
  bool newImported;
  bool anonimous;
  int specialType;
  String coverImgUrl;
  int trackCount;
  String commentThreadId;
  int totalDuration;
  int privacy;
  int trackUpdateTime;
  int playCount;
  int subscribedCount;
  int cloudTrackCount;
  bool ordered;
  List<dynamic> tags;
  dynamic description;
  int status;
  String name;
  int id;
  String coverImgIdStr;

  UserSongEntity(
      {this.subscribers,
        this.subscribed,
        this.creator,
        this.artists,
        this.tracks,
        this.updateFrequency,
        this.backgroundCoverId,
        this.backgroundCoverUrl,
        this.titleImage,
        this.titleImageUrl,
        this.englishTitle,
        this.opRecommend,
        this.recommendInfo,
        this.adType,
        this.trackNumberUpdateTime,
        this.userId,
        this.createTime,
        this.highQuality,
        this.coverImgId,
        this.updateTime,
        this.newImported,
        this.anonimous,
        this.specialType,
        this.coverImgUrl,
        this.trackCount,
        this.commentThreadId,
        this.totalDuration,
        this.privacy,
        this.trackUpdateTime,
        this.playCount,
        this.subscribedCount,
        this.cloudTrackCount,
        this.ordered,
        this.tags,
        this.description,
        this.status,
        this.name,
        this.id,
        this.coverImgIdStr});

  UserSongEntity.fromJson(Map<String, dynamic> json) {
//    if (json['subscribers'] != null) {
//      subscribers = new List<dynamic>();
//      json['subscribers'].forEach((v) {
//        subscribers.add(new dynamic.fromJson(v));
//      });
//    }
    subscribed = json['subscribed'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    artists = json['artists'];
    tracks = json['tracks'];
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    titleImage = json['titleImage'];
    titleImageUrl = json['titleImageUrl'];
    englishTitle = json['englishTitle'];
    opRecommend = json['opRecommend'];
    recommendInfo = json['recommendInfo'];
    adType = json['adType'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    userId = json['userId'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    coverImgId = json['coverImgId'];
    updateTime = json['updateTime'];
    newImported = json['newImported'];
    anonimous = json['anonimous'];
    specialType = json['specialType'];
    coverImgUrl = json['coverImgUrl'];
    trackCount = json['trackCount'];
    commentThreadId = json['commentThreadId'];
    totalDuration = json['totalDuration'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    playCount = json['playCount'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    ordered = json['ordered'];
//    if (json['tags'] != null) {
//      tags = new List<dynamic>();
//      json['tags'].forEach((v) {
//        tags.add(new dynamic.fromJson(v));
//      });
//    }
    description = json['description'];
    status = json['status'];
    name = json['name'];
    id = json['id'];
    coverImgIdStr = json['coverImgId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.subscribers != null) {
//      data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
//    }
    data['subscribed'] = this.subscribed;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['artists'] = this.artists;
    data['tracks'] = this.tracks;
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['titleImage'] = this.titleImage;
    data['titleImageUrl'] = this.titleImageUrl;
    data['englishTitle'] = this.englishTitle;
    data['opRecommend'] = this.opRecommend;
    data['recommendInfo'] = this.recommendInfo;
    data['adType'] = this.adType;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['userId'] = this.userId;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['coverImgId'] = this.coverImgId;
    data['updateTime'] = this.updateTime;
    data['newImported'] = this.newImported;
    data['anonimous'] = this.anonimous;
    data['specialType'] = this.specialType;
    data['coverImgUrl'] = this.coverImgUrl;
    data['trackCount'] = this.trackCount;
    data['commentThreadId'] = this.commentThreadId;
    data['totalDuration'] = this.totalDuration;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['playCount'] = this.playCount;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['ordered'] = this.ordered;
//    if (this.tags != null) {
//      data['tags'] = this.tags.map((v) => v.toJson()).toList();
//    }
    data['description'] = this.description;
    data['status'] = this.status;
    data['name'] = this.name;
    data['id'] = this.id;
    data['coverImgId_str'] = this.coverImgIdStr;
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
