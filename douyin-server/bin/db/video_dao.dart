import 'database_utils.dart';

//视频相关接口
class VideoDao {
  //查询视频列表数据
  Future<List<Map<String, dynamic>>> queryVideoList() async {
    var result =
        await DatabaseManager.pool.execute('select * from tb_video_info');

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }

//查询视频列表数据
  Future<bool> insertVideo(Map<String, dynamic> video) async {
    bool result = await DatabaseManager.insertRow("tb_video_info", video);
    return result;
  }

//根据作品ID获取评论列表
  Future<List<Map<String, dynamic>>> queryCommentList(int id) async {
    var result =
        await DatabaseManager.pool.execute('select * from tb_video_info');

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }
}
