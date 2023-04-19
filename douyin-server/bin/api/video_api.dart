import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../db/video_dao.dart';

class VideoApi {
  //获取视频列表
  Future<Response> _getVideoList(Request request) async {
    var result = await VideoDao().queryVideoList();

    return Response.ok(
        jsonEncode({'code': 200, 'message': 'ok', 'data': result}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        });
  }

  //发布作品
  Future<Response> _publishWorks(Request request) async {
    var formData = await request.readAsString();
    var videoInfo = jsonDecode(formData);

    var result = await VideoDao().insertVideo(videoInfo);

    return Response.ok(
        jsonEncode({'code': 200, 'message': 'ok', 'data': result}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        });
  }

  //根据作品ID获取评论列表
  Future<Response> _getCommentListById(Request request) async {
    var id = request.params['id'] as int;
    var result = await VideoDao().queryCommentList(id);

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

    router.post('/publishWorks', _publishWorks);

    return router;
  }
}
