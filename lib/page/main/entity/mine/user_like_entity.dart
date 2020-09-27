/*
* Author : LiJiqqi
* Date : 2020/9/27
*/


class UserLikeEntity{

  List<int> likes = [];

  UserLikeEntity.fromList(dynamic ids){
    ids.map((id){
      likes.add(id);
    });
  }

}




