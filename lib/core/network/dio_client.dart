import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({required this.dio}) {
    dio
      ..options.baseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app'
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }
}
