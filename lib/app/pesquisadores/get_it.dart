import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores/pesquisadores_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:projac_mobile/core/get_it.dart';

final pesquisadorGetIt = GetIt.asNewInstance();
final pesquisadoresGetIt = GetIt.asNewInstance();

bool setupPesquisadorGetIt() {
  if (pesquisadorGetIt.isRegistered<PesquisadorBloc>()) {
    debugPrint('Pesquisador already initialized');
    return false;
  }

  pesquisadorGetIt
    ..registerFactoryAsync<PesquisadoresRepository>(() async {
      final apiClient0 = await apiClient;
      return PesquisadoresRepository(apiClient0);
    })
    ..registerFactoryAsync<PesquisadorBloc>(
      () async {
        return PesquisadorBloc(
          await pesquisadorGetIt.getAsync<PesquisadoresRepository>(),
        );
      },
    );
  debugPrint('Pesquisador Initialized');

  return true;
}

bool setupPesquisadoresGetIt() {
  if (pesquisadoresGetIt.isRegistered<PesquisadoresBloc>()) {
    debugPrint('Pesquisadores already initialized');
    return false;
  }

  pesquisadoresGetIt
    ..registerFactoryAsync<PesquisadoresRepository>(() async {
      final apiClient0 = await apiClient;
      return PesquisadoresRepository(apiClient0);
    })
    ..registerFactoryAsync<PesquisadoresBloc>(
      () async {
        return PesquisadoresBloc(
          await pesquisadoresGetIt.getAsync<PesquisadoresRepository>(),
        );
      },
    );
  debugPrint('Pesquisadores Initialized');

  return true;
}

Future<void> disposePesquisadorGetIt({
  required bool dispose,
}) async {
  if (!dispose) return;
  await pesquisadorGetIt.reset();
  debugPrint('Pesquisador Disposed');
}

Future<void> disposePesquisadoresGetIt({
  required bool dispose,
}) async {
  if (!dispose) return;
  await pesquisadoresGetIt.reset();
  debugPrint('Pesquisadores Disposed');
}
