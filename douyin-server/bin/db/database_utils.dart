import 'package:mysql_client/mysql_client.dart';

import '../common/global.dart';

class DatabaseManager {
  static final pool = MySQLConnectionPool(
    host: '127.0.0.1',
    port: 3306,
    userName: 'root',
    password: 'root',
    maxConnections: 5,
    databaseName: 'douyin', // optional,
  );

  static Future<bool> insertRow(
      String tableName, Map<String, dynamic> map) async {
    String params = '';
    for (var key in map.keys) {
      params += ':$key,';
    }
    params = params.substring(0, params.length - 1);
    String sql =
        "INSERT INTO `$tableName` (${map.keys.join(',')}) VALUES ($params)";
    logger.d(sql);
    var res = await DatabaseManager.pool.execute(sql, map);
    return res.affectedRows.toInt() > 0;
  }
}

void main(List<String> args) {
  Map<String, dynamic> values = {
    "id": null,
    "user_id": 1,
    "title": "点击报名报名完成✅",
    "alias": "唱将桃花小旺旺💕",
    "pic_user":
        "https://vi1.6rooms.com/live/2021/08/06/13/1003v1628228888774577537.jpg",
    "pic_url":
        "https://vi0.6rooms.com/live/2021/11/04/19/1032v1636023768777843271_l.jpg",
    "play_url":
        "https://minivideo.xiu123.cn/original/ee17c0546f2d4a83b9cca3c7adc076f5/1f7eebd-17cea9d8f78.mp4",
    "sec": 6,
    "favorite_num": 15000,
    "comment_num": 2713,
    "collect_num": 2005,
    "share_num": 2527,
    "is_favorite": 0,
    "is_collected": 0,
    "create_time": DateTime.now(),
    "update_time": DateTime.now(),
    "topic": "#热点"
  };
  DatabaseManager.insertRow("tb_video_info", values);
}
