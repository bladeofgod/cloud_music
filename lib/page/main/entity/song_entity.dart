/*
* Author : LiJiqqi
* Date : 2020/9/29
*/


class SongEntity {
  int id;
  String url;
  int br;
  int size;
  String md5;
  int code;
  int expi;
  String type;
  int gain;
  int fee;
  dynamic uf;
  int payed;
  int flag;
  bool canExtend;
  dynamic freeTrialInfo;
  String level;
  String encodeType;

  SongEntity(
      {this.id,
        this.url,
        this.br,
        this.size,
        this.md5,
        this.code,
        this.expi,
        this.type,
        this.gain,
        this.fee,
        this.uf,
        this.payed,
        this.flag,
        this.canExtend,
        this.freeTrialInfo,
        this.level,
        this.encodeType});

  SongEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    br = json['br'];
    size = json['size'];
    md5 = json['md5'];
    code = json['code'];
    expi = json['expi'];
    type = json['type'];
    gain = json['gain'];
    fee = json['fee'];
    uf = json['uf'];
    payed = json['payed'];
    flag = json['flag'];
    canExtend = json['canExtend'];
    freeTrialInfo = json['freeTrialInfo'];
    level = json['level'];
    encodeType = json['encodeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['br'] = this.br;
    data['size'] = this.size;
    data['md5'] = this.md5;
    data['code'] = this.code;
    data['expi'] = this.expi;
    data['type'] = this.type;
    data['gain'] = this.gain;
    data['fee'] = this.fee;
    data['uf'] = this.uf;
    data['payed'] = this.payed;
    data['flag'] = this.flag;
    data['canExtend'] = this.canExtend;
    data['freeTrialInfo'] = this.freeTrialInfo;
    data['level'] = this.level;
    data['encodeType'] = this.encodeType;
    return data;
  }
}
