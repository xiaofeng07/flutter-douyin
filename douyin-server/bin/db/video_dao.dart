import 'database_utils.dart';

//视频相关接口
class VideoDao {
  //查询视频列表数据
  Future<List<Map<String, dynamic>>> queryVideoList() async {
    var result = await DatabaseManager.pool.execute(
        'SELECT	id, 	user_id, 	title, 	alias, 	pic_user, 	pic_url, 	play_url, 	sec, 	favorite_num, 	comment_num, 	collect_num, 	share_num, 	CASE is_favorite     WHEN 1 THEN TRUE     ELSE FALSE   END AS is_favorite , 	CASE is_collected     WHEN 1 THEN TRUE     ELSE FALSE   END AS is_collected ,  	create_time, 	update_time, 	topicFROM	tb_video_info');

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }

  //根据类型查询视频列表数据
  Future<List<Map<String, dynamic>>> queryVideoListByType() async {
    var result =
        await DatabaseManager.pool.execute('select * from tb_video_info');

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }

  //根据用户ID查询视频列表数据
  Future<List<Map<String, dynamic>>> queryVideoListById(int userId) async {
    var result = await DatabaseManager.pool.execute(
        'select * from tb_video_info where user_id=:userId',
        {"userId": userId});

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }

//发布作品
  Future<bool> insertVideo(Map<String, dynamic> video) async {
    bool result = await DatabaseManager.insertRow("tb_video_info", video);
    return result;
  }

//根据作品ID获取评论列表
  Future<List<Map<String, dynamic>>> queryCommentList(int videoId) async {
    var result = await DatabaseManager.pool.execute(
        'select * from tb_comment where belong_id=:videoId',
        {"videoId": videoId});

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }
}
