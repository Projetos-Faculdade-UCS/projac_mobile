import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores/pesquisadores_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:projac_mobile/core/get_it.dart';

final pesquisadorGetIt = GetIt.asNewInstance();
final pesquisadoresGetIt = GetIt.asNewInstance();

void setupPesquisadorGetIt() {
  pesquisadorGetIt
    ..registerLazySingletonAsync<PesquisadoresRepository>(() async {
      final apiClient0 = await apiClient;
      return PesquisadoresRepository(apiClient0);
    })
    ..registerLazySingletonAsync<PesquisadorBloc>(
      () async {
        return PesquisadorBloc(
          await pesquisadorGetIt.getAsync<PesquisadoresRepository>(),
        );
      },
      dispose: (bloc) => bloc.close(),
    );
  debugPrint('Pesquisador Initialized');
}

void setupPesquisadoresGetIt() {
  pesquisadoresGetIt
    ..registerLazySingletonAsync<PesquisadoresRepository>(() async {
      final apiClient0 = await apiClient;
      return PesquisadoresRepository(apiClient0);
    })
    ..registerLazySingletonAsync<PesquisadoresBloc>(
      () async {
        return PesquisadoresBloc(
          await pesquisadoresGetIt.getAsync<PesquisadoresRepository>(),
        );
      },
      dispose: (bloc) => bloc.close(),
    );
  debugPrint('Pesquisadores Initialized');
}

Future<void> disposePesquisadorGetIt() async {
  await pesquisadorGetIt.reset();
  debugPrint('Pesquisador Disposed');
}

Future<void> disposePesquisadoresGetIt() async {
  await pesquisadoresGetIt.reset();
  debugPrint('Pesquisadores Disposed');
}
