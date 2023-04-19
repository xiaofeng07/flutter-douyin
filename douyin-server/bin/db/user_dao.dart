import 'database_utils.dart';

class UserDao {
  Future<Map<String, dynamic>> login(String userName, String password) async {
    var result =
        await DatabaseManager.pool.execute('select * from tb_video_info');

    final jsonData = result.first.rows.first.typedAssoc();
    print(jsonData.toString());

    return jsonData;
  }
}
