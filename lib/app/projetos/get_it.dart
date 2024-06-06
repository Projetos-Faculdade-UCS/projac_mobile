import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:projac_mobile/app/projetos/bloc/list/projetos_list_bloc.dart';
import 'package:projac_mobile/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:projac_mobile/app/projetos/projetos_search_delegate.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';

final projetosListGetIt = GetIt.asNewInstance();
final projetoGetIt = GetIt.asNewInstance();

void setupProjetosListGetIt() {
  debugPrint('Projetos Initialized');
  projetosListGetIt
    ..registerFactory<ProjetosRepository>(ProjetosRepository.new)
    ..registerFactory<ProjetosListBloc>(
      () => ProjetosListBloc(projetosListGetIt<ProjetosRepository>()),
    )
    ..registerFactory<ProjetosSearchDelegate>(
      () => ProjetosSearchDelegate(projetosListGetIt<ProjetosRepository>()),
    );
}

void setupProjetoGetIt() {
  debugPrint('Projeto Initialized');
  projetoGetIt
    ..registerFactory<ProjetosRepository>(ProjetosRepository.new)
    ..registerFactory<ProjetoBloc>(
      () => ProjetoBloc(projetosListGetIt<ProjetosRepository>()),
    );
}

void disposeProjetosListGetIt() {
  debugPrint('ProjetosList Disposed');
  projetosListGetIt.reset();
}

void disposeProjetoGetIt() {
  debugPrint('Projetos Disposed');
  projetoGetIt.reset();
}
