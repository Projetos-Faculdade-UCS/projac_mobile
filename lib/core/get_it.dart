import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projac_mobile/core/api/api_client.dart';

final GetIt getIt = GetIt.instance;

void setupApi({
  required String baseUrl,
  required String apiKey,
}) {
  getIt
    ..registerLazySingleton<Dio>(() {
      final dio = Dio();
      dio.options.baseUrl = baseUrl;
      dio.options.headers = {
        'Content-Type': 'application/json',
        'X-API-Key': apiKey,
      };
      return dio;
    })
    ..registerLazySingleton<ApiClient>(() {
      final dio = getIt<Dio>();
      return ApiClient(dio, baseUrl: dio.options.baseUrl);
    });
}

ApiClient get apiClient => getIt<ApiClient>();
