import 'dart:convert';

import 'package:mysql_client/mysql_client.dart';

final pool = MySQLConnectionPool(
  host: '127.0.0.1',
  port: 3306,
  userName: 'root',
  password: 'root',
  maxConnections: 5,
  databaseName: 'douyin', // optional,
);

//查询视频列表数据
Future<List<Map<String, dynamic>>> queryVideoList() async {
  var result = await pool.execute('select * from tb_video_info');

  final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
  print(jsonData.toString());

  return jsonData;
}

//根据作品ID获取评论列表
Future<List<Map<String, dynamic>>> queryCommentList(int id) async {
  var result = await pool.execute('select * from tb_video_info');

  final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
  print(jsonData.toString());

  return jsonData;
}

Future<Map<String, dynamic>> login(String userName, String password) async {
  var result = await pool.execute('select * from tb_video_info');

  final jsonData = result.first.rows.first.typedAssoc();
  print(jsonData.toString());

  return jsonData;
}
