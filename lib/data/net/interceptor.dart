import 'package:dio/dio.dart';
import 'package:flutter_douyin/common/app_config.dart';
import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_douyin/data/model/base_response.dart';

class HeaderInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //添加统一请求头
    options.headers.addAll({
      "Authorization": "Bearer xxx",
    });
    return super.onRequest(options, handler);
  }
}

class CacheInterceptor extends Interceptor {
  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    //处理缓存
    return super.onResponse(response, handler);
  }
}

class ResponseInterceptor extends Interceptor {
  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    final result = _handleResponse(response);
    return handler.resolve(result);
  }

  static Response _handleResponse(Response response) {
    final int code = response.data['code'];
    String message = "";
    if (code == Code.SUCCESS) {
      message = response.data['message'];
    } else {
      switch (code) {
        case 400:
          message = "Bad Request";
          break;
        case 401:
          message = "Unauthorized";
          break;
        case 403:
          message = "Forbidden";
          break;
        case 404:
          message = "Not Found";
          break;
        case 500:
          message = "Internal Server Error";
          break;
        case 503:
          message = "Service Unavailable";
          break;
      }
    }

    ResultData resultData = ResultData(
        data: response.data['data'],
        isSuccess: true,
        code: code,
        message: message,
        headers: response.headers.map);
    return Response(requestOptions: response.requestOptions, data: response.data);
  }



  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
