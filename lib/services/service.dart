import 'dart:convert';

import 'package:dio/dio.dart';

class Service {
  static Dio? _dio;

  static void init() {
    _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/api/employee'));
    // ..interceptors.add(PrettyDioLogger(requestBody: true));
  }

  static Future? get(String url) async {
    try {
      final Response response = await _dio!.get(url);
      // print(response.data);
      return jsonDecode(response.data);
    } on DioError catch (e) {
      print("error : ${e.message}");
      return e.response!.data;
    }
  }

  static Future? post(String url, Map<String, dynamic> body) async {
    try {
      FormData data = FormData.fromMap(body);
      final response = await _dio!.post(url, data: data);
      return jsonDecode(response.data);
    } on DioError catch (e) {
      print("dio error : ${e.message}");
      if (e.response!.data != null)
        return jsonDecode(e.response!.data);
      else
        return null;
    } catch (e) {
      print("catch error : $e");
      return null;
    }
  }
}
