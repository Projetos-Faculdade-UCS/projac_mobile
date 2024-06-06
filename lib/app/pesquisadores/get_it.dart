import 'package:get_it/get_it.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:projac_mobile/core/get_it.dart';

final pesquisadorGetIt = GetIt.asNewInstance();

void setupPesquisadorGetIt() {
  pesquisadorGetIt
    ..registerLazySingletonAsync<PesquisadoresRepository>(() async {
      final apiClient0 = await apiClient;
      return PesquisadoresRepository(apiClient0);
    })
    ..registerLazySingleton<PesquisadorBloc>(() {
      return PesquisadorBloc();
    });
}

void disposePesquisadorGetIt() {
  pesquisadorGetIt.reset();
}
