import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:steadfast_task/data/datasources/remote/dio_service/api_interceptor.dart';
import 'package:steadfast_task/data/datasources/remote/dio_service/api_key.dart';

class DioBuilderResponse {
  DioBuilderResponse({required this.dio, required this.dioOptions});
  Dio dio;
  Options dioOptions;
}

class DioBuilder {
  Options _getCachedDioOptions() {
    return buildCacheOptions(
      const Duration(days: 30),
      forceRefresh: true,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 501;
        },
      ),
    );
  }

  Future<DioBuilderResponse> buildCachedDio({
    bool shouldQueue = false,
  }) async {
    final dioCacheManager = DioCacheManager(CacheConfig());
    final dioOptions = _getCachedDioOptions();
    final dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    dio.interceptors.add(DioInterceptor(dio));
    dio.interceptors.add(dioCacheManager.interceptor as Interceptor);
    if (shouldQueue) dio.interceptors.add(QueuedInterceptor());
    return DioBuilderResponse(dio: dio, dioOptions: dioOptions);
  }

  Future<DioBuilderResponse> buildNonCachedDio({
    bool shouldQueue = false,
  }) async {
    final dioOptions = _getDioOptions();
    final dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    dio.interceptors.add(DioInterceptor(dio));
    if (shouldQueue) dio.interceptors.add(QueuedInterceptor());
    return DioBuilderResponse(dio: dio, dioOptions: dioOptions);
  }

  Options _getDioOptions() {
    return Options(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 501;
      },
    );
  }
}
