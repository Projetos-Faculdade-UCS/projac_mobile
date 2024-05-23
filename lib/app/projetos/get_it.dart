import 'package:get_it/get_it.dart';
import 'package:projac_mobile/app/projetos/bloc/projetos_bloc.dart';
import 'package:projac_mobile/app/projetos/projetos_search_delegate.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';

final projetosGetIt = GetIt.asNewInstance();

void setupProjetosGetIt() {
  print('Projetos Initialized');
  projetosGetIt
    ..registerFactory<ProjetosRepository>(ProjetosRepository.new)
    ..registerFactory<ProjetosBloc>(
      () => ProjetosBloc(projetosGetIt<ProjetosRepository>()),
    )
    ..registerFactory<ProjetosSearchDelegate>(
      () => ProjetosSearchDelegate(projetosGetIt<ProjetosRepository>()),
    );
}

void disposeProjetosGetIt() {
  print('Projetos Disposed');
  projetosGetIt.reset();
}