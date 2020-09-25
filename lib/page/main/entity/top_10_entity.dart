/*
* Author : LiJiqqi
* Date : 2020/9/25
*/


class TopStarEntity {
  int img1v1Id;
  int topicPerson;
  List<dynamic> alias;
  int picId;
  int musicSize;
  int albumSize;
  String briefDesc;
  bool followed;
  String img1v1Url;
  String trans;
  String picUrl;
  String name;
  int id;
  int accountId;
  String picIdStr;
  String img1v1IdStr;

  TopStarEntity(
      {this.img1v1Id,
        this.topicPerson,
        this.alias,
        this.picId,
        this.musicSize,
        this.albumSize,
        this.briefDesc,
        this.followed,
        this.img1v1Url,
        this.trans,
        this.picUrl,
        this.name,
        this.id,
        this.accountId,
        this.picIdStr,
        this.img1v1IdStr});

  TopStarEntity.fromJson(Map<String, dynamic> json) {
    img1v1Id = json['img1v1Id'];
    topicPerson = json['topicPerson'];
//    if (json['alias'] != null) {
//      alias = new List<Null>();
//      json['alias'].forEach((v) {
//        alias.add(new Null.fromJson(v));
//      });
//    }
    picId = json['picId'];
    musicSize = json['musicSize'];
    albumSize = json['albumSize'];
    briefDesc = json['briefDesc'];
    followed = json['followed'];
    img1v1Url = json['img1v1Url'];
    trans = json['trans'];
    picUrl = json['picUrl'];
    name = json['name'];
    id = json['id'];
    accountId = json['accountId'];
    picIdStr = json['picId_str'];
    img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this.img1v1Id;
    data['topicPerson'] = this.topicPerson;
//    if (this.alias != null) {
//      data['alias'] = this.alias.map((v) => v.toJson()).toList();
//    }
    data['picId'] = this.picId;
    data['musicSize'] = this.musicSize;
    data['albumSize'] = this.albumSize;
    data['briefDesc'] = this.briefDesc;
    data['followed'] = this.followed;
    data['img1v1Url'] = this.img1v1Url;
    data['trans'] = this.trans;
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['picId_str'] = this.picIdStr;
    data['img1v1Id_str'] = this.img1v1IdStr;
    return data;
  }
}
