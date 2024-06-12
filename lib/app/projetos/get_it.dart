import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:projac_mobile/app/projetos/bloc/list/projetos_list_bloc.dart';
import 'package:projac_mobile/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:projac_mobile/app/projetos/projetos_search_delegate.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';

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
    )
    ..registerFactory<ProjetosSearchDelegate>(
      () => ProjetosSearchDelegate(projetosListGetIt<ProjetosRepository>()),
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
