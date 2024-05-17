import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projac_mobile/app/app_widget.dart';
import 'package:projac_mobile/core/env.dart';
import 'package:projac_mobile/core/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  setupApi(
    apiKey: Env.apiKey,
    baseUrl: Env.apiUrl,
  );

  runApp(
    const AppWidget(),
  );
}
