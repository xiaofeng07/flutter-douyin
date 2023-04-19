

import 'package:flutter_douyin/data/model/base_response.dart';
import 'package:flutter_douyin/data/model/user_info.dart';
import 'package:flutter_douyin/data/net/dio_manager.dart';

/// @Name:           Api
/// @Description:    网络请求接口
/// @Author:         "xiaofeng07"
/// @CreateDate:     2023/4/19 23:01
/// @UpdateUser:     "xiaofeng07"
/// @UpdateDate:     2023/4/19 23:01
/// @UpdateRemark:
/// @Version:        1.0

class Api {
  ///================================用户相关====================================
  Future<UserInfo> login(String userName,String password)async{
    ResultData resultData = await DioManager().post("/login", {"user_name":userName,"password":password});
    return resultData.data;
  }
}