//管理后台的接口

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserManagerApi {
  //获取用户列表
  Future<Response> _queryUserList(Request request) async {
    return Response.ok('getVideoList');
  }

  Router get router {
    final router = Router();

    //一个Handler可以有多个路由
    router.get('/queryUserList', _queryUserList);

    return router;
  }
}
