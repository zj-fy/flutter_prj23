import 'package:dio/dio.dart';
import '../api/user_api.dart';
import 'init_dio.dart';
import 'home_api.dart';

class API {
  Dio _dio = initDio();

  API() {
    // _dio = initDio();
  }

  HomeAPI get home => HomeAPI(_dio);
  UserAPI get user => UserAPI(_dio);

}