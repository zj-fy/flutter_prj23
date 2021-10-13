import 'package:dio/dio.dart';

class UserAPI {
  final Dio _dio;

  UserAPI(this._dio);

  Future<dynamic> login(String phone, String password) async {
    // 表单数据
    FormData formData = FormData.fromMap({
      "username": phone,
      "password": password,
    });
    // 发送 post 请求
    Response res = await _dio.post('/user/login', data: formData);

    print(res.data);
    return res.data;
  }
}
