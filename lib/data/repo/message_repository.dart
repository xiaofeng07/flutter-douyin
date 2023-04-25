

import 'package:flutter_douyin/data/model/video_info.dart';
import 'package:flutter_douyin/data/net/api.dart';

class MessageRepository {
 Future<List<VideoInfo>> getVideoList() async{
    return Api().getVideoList();
  }
}
