import 'package:acadion/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:acadion/app/pesquisadores/bloc/pesquisadores/pesquisadores_bloc.dart';
import 'package:acadion/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final pesquisadorGetIt = GetIt.asNewInstance();
final pesquisadoresGetIt = GetIt.asNewInstance();

bool setupPesquisadorGetIt() {
  if (pesquisadorGetIt.isRegistered<PesquisadorBloc>()) {
    debugPrint('Pesquisador already initialized');
    return false;
  }

  pesquisadorGetIt
    ..registerFactory<PesquisadoresRepository>(PesquisadoresRepository.new)
    ..registerFactory<PesquisadorBloc>(
      () {
        return PesquisadorBloc(
          pesquisadorGetIt.get<PesquisadoresRepository>(),
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
    ..registerFactory<PesquisadoresRepository>(PesquisadoresRepository.new)
    ..registerFactory<PesquisadoresBloc>(
      () {
        return PesquisadoresBloc(
          pesquisadoresGetIt.get<PesquisadoresRepository>(),
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
