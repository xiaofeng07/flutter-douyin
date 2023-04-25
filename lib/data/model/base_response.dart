import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_douyin/data/model/user_info.dart';
import 'package:flutter_douyin/data/model/video_info.dart';

class ResultData<T> {
  T? data;
  bool? isSuccess;
  int? code;
  String? message;
  var headers;


  ResultData({this.data, this.isSuccess, this.code, this.message,this.headers});

  factory ResultData.fromJson(json) {
    logger.d("ResultData.fromJson===>${json}");
    return ResultData(
      // data值需要经过工厂转换为我们传进来的类型
      data: ResultDataFactory.generateOBJ<T>(json['data']),
      isSuccess: json['code']==200,
      code: json['code'],
      message: json['message']
    );
  }
}


class ResultDataFactory {
  static dynamic generateOBJ<T>(json) {
    if (json is List) {
      switch(T){
        case List<VideoInfo>:
          List<VideoInfo> list = json.map((i) => VideoInfo.fromJson(i)).toList();
          return list;
      }
    } else {
      switch(T){
        case UserInfo:
          UserInfo userInfo = UserInfo.fromJson(json);
          return userInfo;
        case VideoInfo:
          VideoInfo videoInfo = VideoInfo.fromJson(json);
          return videoInfo;
      }
    }
  }
}