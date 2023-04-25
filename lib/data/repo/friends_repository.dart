

import 'package:flutter_douyin/data/model/video_info.dart';
import 'package:flutter_douyin/data/net/api.dart';

class FriendsRepository {
 Future<List<VideoInfo>> getFriendsVideoList(List<int> friendIds) async{
    return Api().getFriendsVideoList(friendIds);
  }
}
