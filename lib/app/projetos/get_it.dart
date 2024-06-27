import 'package:acadion/app/projetos/bloc/list/projetos_list_bloc.dart';
import 'package:acadion/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:acadion/app/projetos/repositories/projetos_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final projetosListGetIt = GetIt.asNewInstance();
final projetoGetIt = GetIt.asNewInstance();

bool setupProjetosListGetIt() {
  if (projetosListGetIt.isRegistered<ProjetosListBloc>()) {
    debugPrint('ProjetosList already initialized');
    return false;
  }

  debugPrint('Projetos Initialized');
  projetosListGetIt
    ..registerFactory<ProjetosRepository>(ProjetosRepository.new)
    ..registerFactory<ProjetosListBloc>(
      () => ProjetosListBloc(projetosListGetIt<ProjetosRepository>()),
    );

  return true;
}

bool setupProjetoGetIt() {
  if (projetoGetIt.isRegistered<ProjetoBloc>()) {
    debugPrint('Projeto already initialized');
    return false;
  }

  projetoGetIt
    ..registerFactory<ProjetosRepository>(ProjetosRepository.new)
    ..registerFactory<ProjetoBloc>(
      () => ProjetoBloc(projetoGetIt<ProjetosRepository>()),
    );
  debugPrint('Projeto Initialized');
  return true;
}

void disposeProjetosListGetIt({
  required bool dispose,
}) {
  if (!dispose) return;
  projetosListGetIt.reset();
  debugPrint('ProjetosList Disposed');
}

void disposeProjetoGetIt({
  required bool dispose,
}) {
  if (!dispose) return;
  projetoGetIt.reset();
  debugPrint('Projeto Disposed');
}
