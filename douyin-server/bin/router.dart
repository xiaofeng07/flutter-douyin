import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'api/message_api.dart';
import 'api/user_api.dart';
import 'api/video_api.dart';
import 'db/video_dao.dart';
import 'service/user_manager_api.dart';

final router = Router()
  ..mount('/api/v1/video', VideoApi().router)
  ..mount('/api/v1/user', UserApi().router)
  ..mount('/api/v1/message', MessageApi().router)
  ..mount('/manager/api/v1', UserManagerApi().router)
  ..get('/<ignored|.*>', _notFoundHandler);

Response _notFoundHandler(Request request) {
  return Response.notFound('Page not found');
}
