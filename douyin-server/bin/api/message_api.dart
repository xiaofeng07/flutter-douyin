import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../db/message_dao.dart';

//消息相关接口
class MessageApi {
  //获取消息列表
  Future<Response> _getMessageList(Request request) async {
    var formData = await request.readAsString();
    var result = await MessageDao().queryMessageList();

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
