import 'package:dio/dio.dart';

abstract class BaseApiClient {
  static Dio dioClient = Dio();

  static Future<Response<T>?> getResponse<T>(String url) async {
    try {
      var resp = await dioClient.get<T>(url);

      return resp;
    } catch (e) {
      return null;
    }
  }

  Future<Response<T>?> makePostRequest<T>(String url, dynamic data) async {
    try {
      var resp = await dioClient.post<T>(url, data: data);
      return resp;
    } catch (e) {
      return null;
    }
  }
}
