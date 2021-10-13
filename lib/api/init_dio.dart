import 'package:dio/dio.dart';

Dio initDio() {
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://rap2api.taobao.org/app/mock/255557/api/v1",
    connectTimeout: 10000,
  );

  Dio dio = Dio(_baseOptions);

  dio.interceptors.add(InterceptorsWrapper(
    // 请求拦截
      onRequest:(options, handler){
        // 请求开始之前，做一些处理
        return handler.next(options); //continue
      },
      // 响应拦截
      onResponse:(response,handler) {
        // 对响应数据进行处理
        return handler.next(response); // continue
      },
      // 报错拦截
      onError: (DioError e, handler) {
        // 对响应报错进行处理
        return  handler.next(e);//continue
      }
  ));

  // 返回 dio
  return dio;
}