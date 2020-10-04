



class SearchHistoryEntity{

  int timeStamp;
  String keyword;

  SearchHistoryEntity.fromJson(Map<String,dynamic> json){
    timeStamp = json['timeStamp'];
    keyword = json['keyword'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['timeStamp'] = timeStamp;
    data['keyword'] = keyword;
    return data;
  }

}