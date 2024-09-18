import 'dart:developer';

import 'package:dio/dio.dart';

///网络请求与返回信息打印拦截器
class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("\nrequest-------------->");
    options.headers?.forEach((key, value) {
      log("请求头信息：key=$key  value=${value.toString()}");
    });
    log("path:${options.uri}");
    log("method:${options.method}");
    log("data:${options.data}");
    log("queryParameters:${options.queryParameters.toString()}");
    log("<--------------request\n");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("\nresponse-------------->");
    log("path:${response.realUri}");
    log("headers:${response.headers.toString()}");
    log("statusMessage:${response.statusMessage}");
    log("statusCode:${response.statusCode}");
    log("extra:${response.extra.toString()}");
    log("data:${response.data}");
    log("<--------------response\n");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("\nonError-------------->");
    log("error:${err.toString()}");
    log("<--------------onError\n");
    super.onError(err, handler);
  }
}
