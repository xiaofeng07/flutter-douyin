import 'dart:math';

import 'database_utils.dart';

class UserDao {
  Future<Map<String, dynamic>> login(String userName, String password) async {
    var result =
        await DatabaseManager.pool.execute('select * from tb_user_info where');

    final jsonData = result.first.rows.first.typedAssoc();
    print(jsonData.toString());

    return jsonData;
  }

  Future<Map<String, dynamic>?> register(Map<String, dynamic> user) async {
    var result = await DatabaseManager.insertRow('tb_user_info', user);
    if (result) {
      //注册成功返回用户信息
      return user;
    } else {
      return null;
    }
  }
}
