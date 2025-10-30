import 'package:acadion/core/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:path_provider/path_provider.dart';

final GetIt getIt = GetIt.instance;

void setupApi({
  required String baseUrl,
  required String apiKey,
  required String apiKeyHeader,
  required String apiKeyPrefix,
}) {
  getIt
    ..registerLazySingletonAsync<CacheOptions>(
      () async {
        final dir = await getApplicationDocumentsDirectory();
        return CacheOptions(
          store: HiveCacheStore('${dir.path}/hiveCache'),
          hitCacheOnErrorCodes: [401, 403],
          maxStale: const Duration(days: 1),
          // policy: CachePolicy.forceCache,
          // policy: CachePolicy.noCache,
          priority: CachePriority.high,
        );
      },
    )
    ..registerLazySingletonAsync<DioCacheInterceptor>(() async {
      final cacheOptions = await getIt.getAsync<CacheOptions>();
      return DioCacheInterceptor(options: cacheOptions);
    })
    ..registerLazySingletonAsync<Dio>(() async {
      final dio = Dio()
        ..interceptors.add(await getIt.getAsync<DioCacheInterceptor>());
      dio.options.baseUrl = baseUrl;
      dio.options.headers = {
        'Content-Type': 'application/json',
        apiKeyHeader: '$apiKeyPrefix$apiKey',
      };
      return dio;
    })
    ..registerLazySingletonAsync<ApiClient>(() async {
      final dio = await getIt.getAsync<Dio>();
      return ApiClient(dio, baseUrl: dio.options.baseUrl);
    });
}

Future<ApiClient> get apiClient => getIt.getAsync<ApiClient>();
