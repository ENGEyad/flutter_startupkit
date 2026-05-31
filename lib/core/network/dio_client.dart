import 'package:dio/dio.dart';
import '../error/failures.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: Headers.jsonContentType,
    );

    // Custom interceptors for enterprise features (e.g. dynamic headers, logging)
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add custom authorization headers or API keys here
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (dioError, handler) {
          return handler.next(dioError);
        },
      ),
    );
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('Connection timed out. Please try again.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final statusMessage = error.response?.statusMessage ?? 'Server returned an error';
        return ServerFailure(
          'Error $statusCode: $statusMessage',
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return const NetworkFailure('Request was cancelled.');
      case DioExceptionType.connectionError:
        return const NetworkFailure('No internet connection. Please verify your network.');
      default:
        return const ServerFailure('An unexpected error occurred. Please try again later.');
    }
  }
}
