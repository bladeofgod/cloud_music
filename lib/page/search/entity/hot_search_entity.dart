


class HotSearchEntity {
  String searchWord;
  int score;
  String content;
  int source;
  int iconType;
  String iconUrl;
  String url;
  String alg;

  HotSearchEntity(
      {this.searchWord,
        this.score,
        this.content,
        this.source,
        this.iconType,
        this.iconUrl,
        this.url,
        this.alg});

  HotSearchEntity.fromJson(Map<String, dynamic> json) {
    searchWord = json['searchWord'];
    score = json['score'];
    content = json['content'];
    source = json['source'];
    iconType = json['iconType'];
    iconUrl = json['iconUrl'];
    url = json['url'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchWord'] = this.searchWord;
    data['score'] = this.score;
    data['content'] = this.content;
    data['source'] = this.source;
    data['iconType'] = this.iconType;
    data['iconUrl'] = this.iconUrl;
    data['url'] = this.url;
    data['alg'] = this.alg;
    return data;
  }
}
