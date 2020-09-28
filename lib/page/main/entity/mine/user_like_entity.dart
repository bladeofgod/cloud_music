/*
* Author : LiJiqqi
* Date : 2020/9/27
*/


class UserLikeEntity{

  List<int> likes = [];

  UserLikeEntity.fromList(List<dynamic> ids){
    ids.forEach((id){
      likes.add(id);
    });
  }

}




