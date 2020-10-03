class VideoUrlEntity {
  String id;
  String url;
  int size;
  int validityTime;
  bool needPay;
  dynamic payInfo;
  int r;

  VideoUrlEntity(
      {this.id,
        this.url,
        this.size,
        this.validityTime,
        this.needPay,
        this.payInfo,
        this.r});

  VideoUrlEntity.fromJson(Map<String, dynamic> json) {
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
