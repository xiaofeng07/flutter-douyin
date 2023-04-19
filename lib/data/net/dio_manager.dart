import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_douyin/common/app_config.dart';
import 'package:flutter_douyin/data/model/base_response.dart';
import 'package:flutter_douyin/data/net/interceptor.dart';
import 'package:flutter_douyin/utils/dialog_utils.dart';

/// @Name:           DioManager
/// @Description:    Dio库封装
/// @Author:         "xiaofeng07"
/// @CreateDate:     2023/4/19 23:00
/// @UpdateUser:     "xiaofeng07"
/// @UpdateDate:     2023/4/19 23:00
/// @UpdateRemark:
/// @Version:        1.0

class DioManager {
  late Dio _dio;

  static DioManager? _instance;

  DioManager._() {
      if(_dio == null){
        final Dio dio = Dio();
        dio.options = BaseOptions(
          baseUrl: Address.BASE_URL,
          receiveTimeout: const Duration(seconds: 5),
          connectTimeout: const Duration(seconds: 6),
        );
        dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
        dio.interceptors.add(HeaderInterceptor());
        dio.interceptors.add(ResponseInterceptor());
        dio.interceptors.add(CacheInterceptor());
      }
  }

  setBaseUrl(String baseUrl){
      _dio.options.baseUrl = baseUrl;
  }

  factory DioManager() {
    _instance ??= DioManager._();
    return _instance!;
  }

  Future<ResultData> get(String path,
      {Map<String, dynamic>? queryParameters,withLoading = false}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    try {
      final response =
      await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

   Future<ResultData> post(String path, dynamic data, {withLoading = false}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  Future<ResultData> put(String path, dynamic data, {withLoading = false}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  Future<ResultData> delete(String path, {withLoading = false}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    try {
      final response = await _dio.delete(path);
      return response.data;
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

  Future<ResultData> upload(String path, File file, {withLoading = false}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    try {
      final formData = FormData.fromMap({"file": await MultipartFile.fromFile(file.path)});
      final response = await _dio.post(path, data: formData);
      return response.data;
    } on DioError catch (e) {
      return _handleError(e);
    }
  }

   Future<File> download(String url, String savePath, {withLoading = false}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    final response = await _dio.download(url, savePath);
    return File(savePath);
  }

  static dynamic _handleError(DioError error) {
    String errorDescription = "";
    if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      errorDescription = "请求超时，请检查网络后重试";
    } else if (error.type == DioErrorType.badResponse) {
      errorDescription = "服务器异常，请稍后重试";
    } else if (error.type == DioErrorType.cancel) {
      errorDescription = "请求已取消";
    } else {
      errorDescription = "网络异常，请检查网络后重试";
    }
    throw errorDescription;
  }
}
