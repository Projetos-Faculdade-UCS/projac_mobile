import 'package:acadion/app/producoes_academicas/bloc/producao_academica/producao_academica_bloc.dart';
import 'package:acadion/app/producoes_academicas/bloc/producoes_academicas/producoes_academicas_bloc.dart';
import 'package:acadion/app/producoes_academicas/bloc/producoes_academicas_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final producaoAcademicaGetIt = GetIt.asNewInstance();
final producoesAcademicasGetIt = GetIt.asNewInstance();

bool setupProducoesAcademicasGetIt() {
  if (producoesAcademicasGetIt.isRegistered<ProducoesAcademicasRepository>()) {
    debugPrint('Produções Acadêmicas already initialized');
    return false;
  }

  producoesAcademicasGetIt
    ..registerFactory(ProducoesAcademicasRepository.new)
    ..registerFactory(
      () => ProducoesAcademicasBloc(producoesAcademicasGetIt.get()),
    );

  debugPrint('Produções Acadêmicas Initialized');

  return true;
}

bool setupProducaoAcademicaGetIt() {
  if (producaoAcademicaGetIt.isRegistered<ProducaoAcademicaBloc>()) {
    debugPrint('Produção Acadêmica already initialized');
    return false;
  }

  producaoAcademicaGetIt
    ..registerFactory(ProducoesAcademicasRepository.new)
    ..registerFactory(
      () => ProducaoAcademicaBloc(producaoAcademicaGetIt.get()),
    );

  debugPrint('Produção Acadêmica Initialized');
  return true;
}

Future<void> disposeProducoesAcademicasGetIt({
  required bool dispose,
}) async {
  if (!dispose) return;
  await producoesAcademicasGetIt.reset();

  debugPrint('Produções Acadêmicas Disposed');
}

Future<void> disposeProducaoAcademicaGetIt({
  required bool dispose,
}) async {
  if (!dispose) return;
  await producaoAcademicaGetIt.reset();

  debugPrint('Produção Acadêmica Disposed');
}
