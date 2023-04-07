import 'package:dio/dio.dart';
import 'package:flutter_douyin/common/global.dart';

final dio = Dio();

void getHttp() async {
  final response = await dio.get('http://10.0.2.2:8080/api/v1/getVideoList');
  logger.d(response);
}