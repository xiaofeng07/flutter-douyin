import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../db/user_dao.dart';

//用户相关接口
class UserApi {
  //登录
  Future<Response> _login(Request request) async {
    var formData = await request.readAsString();
    var userInfo = jsonDecode(formData);

    var result = await UserDao().login(userInfo.name, userInfo.password);

    return Response.ok(
        jsonEncode({'code': 200, 'message': 'ok', 'data': result}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        });
  }

  Router get router {
    final router = Router();

    router.post('/login', _login);

    return router;
  }
}
