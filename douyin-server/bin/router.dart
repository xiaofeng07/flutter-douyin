import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'database_helper.dart';

final router = Router()
  ..mount('/api/v1/video', VideoApi().router)
  ..mount('/api/v1/user', UserApi().router)
  ..mount('/api/v1/message', MessageApi().router)
  ..mount('/manager/api/v1', Service().router)
  ..get('/<ignored|.*>', _notFoundHandler);

Response _notFoundHandler(Request request) {
  return Response.notFound('Page not found');
}

//视频相关接口
class VideoApi {
  //获取视频列表
  Future<Response> _getVideoList(Request request) async {
    var result = await queryVideoList();

    return Response.ok(
        jsonEncode({'code': 200, 'message': 'ok', 'data': result}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        });
  }

  //根据作品ID获取评论列表
  Future<Response> _getCommentListById(Request request) async {
    var id = request.params['id'] as int;
    var result = await queryCommentList(id);

    return Response.ok(
        jsonEncode({'code': 200, 'message': 'ok', 'data': result}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        });
  }

  Router get router {
    final router = Router();

    router.get('/getVideoList', _getVideoList);

    router.get('/getCommentList/<id>', _getCommentListById);

    return router;
  }
}

//用户相关接口
class UserApi {
  //登录
  Future<Response> _login(Request request) async {
    var formData = await request.readAsString();
    var userInfo = jsonDecode(formData);

    var result = await queryVideoList();

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

//消息相关接口
class MessageApi {
  //获取消息列表
  Future<Response> _getMessageList(Request request) async {
    var formData = await request.readAsString();
    var result = await queryMessageList();

    return Response.ok(
        jsonEncode({'code': 200, 'message': 'ok', 'data': result}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        });
  }

  Router get router {
    final router = Router();

    router.post('/getMessageList', _getMessageList);

    return router;
  }
}

//管理后台的接口
class Service {
  //获取用户列表
  Future<Response> _queryUserList(Request request) async {
    queryVideoList();
    return Response.ok('getVideoList');
  }

  Router get router {
    final router = Router();

    //一个Handler可以有多个路由
    router.get('/queryUserList', _queryUserList);

    return router;
  }
}
