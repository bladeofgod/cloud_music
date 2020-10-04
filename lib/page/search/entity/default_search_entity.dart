


class DefaultSearchEntity {
  String showKeyword;
  String realkeyword;
  int searchType;
  int action;
  String alg;
  int gap;

  DefaultSearchEntity(
      {this.showKeyword,
        this.realkeyword,
        this.searchType,
        this.action,
        this.alg,
        this.gap});

  DefaultSearchEntity.fromJson(Map<String, dynamic> json) {
    showKeyword = json['showKeyword'];
    realkeyword = json['realkeyword'];
    searchType = json['searchType'];
    action = json['action'];
    alg = json['alg'];
    gap = json['gap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showKeyword'] = this.showKeyword;
    data['realkeyword'] = this.realkeyword;
    data['searchType'] = this.searchType;
    data['action'] = this.action;
    data['alg'] = this.alg;
    data['gap'] = this.gap;
    return data;
  }
}





