import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient._private() {
    _dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 5), // Updated to use Duration
      receiveTimeout: Duration(seconds: 3), // Updated to use Duration
      responseType: ResponseType.json,
      baseUrl: 'https://api.escuelajs.co/api/v1',
    );
  }

  static final DioClient _singletonConstructor = DioClient._private();

  factory DioClient() {
    return _singletonConstructor;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
