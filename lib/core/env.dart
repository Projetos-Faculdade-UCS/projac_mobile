// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'API_URL')
  static final String apiUrl = _Env.apiUrl;
  @EnviedField(varName: 'API_KEY')
  static final String apiKey = _Env.apiKey;
  @EnviedField(varName: 'API_KEY_HEADER')
  static final String apiKeyHeader = _Env.apiKeyHeader;
  @EnviedField(varName: 'API_KEY_PREFIX')
  static final String apiKeyPrefix = _Env.apiKeyPrefix;
}
