import 'package:acadion/app/app_widget.dart';
import 'package:acadion/core/env.dart';
import 'package:acadion/core/get_it.dart';
import 'package:acadion/core/theme/theme_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rive/rive.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

late final RiveFile notFoundRive;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  getIt.registerLazySingleton(ThemeCubit.new);

  setupApi(
    apiKey: Env.apiKey,
    baseUrl: Env.apiUrl,
    apiKeyHeader: Env.apiKeyHeader,
    apiKeyPrefix: Env.apiKeyPrefix,
  );

  notFoundRive = await RiveFile.asset(
    'assets/lottie/not_found.riv',
  );

  if (kReleaseMode) {
    await _initSentry();
  } else {
    runApp(
      const AppWidget(),
    );
  }
}

Future<void> _initSentry() async {
  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://af546c748515205f2eab4576b9cd7344@o4506401384955904.ingest.us.sentry.io/4507486861459456'
        ..tracesSampleRate = 1.0
        ..profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      const SentryWidget(
        child: AppWidget(),
      ),
    ),
  );
}
