class SearchSuggestEntity {
  List<AllMatch> allMatch;

  SearchSuggestEntity({this.allMatch});

  SearchSuggestEntity.fromJson(Map<String, dynamic> json) {
    if (json['allMatch'] != null) {
      allMatch = new List<AllMatch>();
      json['allMatch'].forEach((v) {
        allMatch.add(new AllMatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allMatch != null) {
      data['allMatch'] = this.allMatch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllMatch {
  String keyword;
  int type;
  String alg;
  String lastKeyword;
  String feature;

  AllMatch({this.keyword, this.type, this.alg, this.lastKeyword, this.feature});

  AllMatch.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    type = json['type'];
    alg = json['alg'];
    lastKeyword = json['lastKeyword'];
    feature = json['feature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;
    data['type'] = this.type;
    data['alg'] = this.alg;
    data['lastKeyword'] = this.lastKeyword;
    data['feature'] = this.feature;
    return data;
  }
}
