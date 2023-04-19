import 'database_utils.dart';

class MessageDao {
  //获取消息列表
  Future<List<Map<String, dynamic>>> queryMessageList() async {
    var result =
        await DatabaseManager.pool.execute('select * from tb_video_info');

    final jsonData = result.rows.map((row) => row.typedAssoc()).toList();
    print(jsonData.toString());

    return jsonData;
  }
}
