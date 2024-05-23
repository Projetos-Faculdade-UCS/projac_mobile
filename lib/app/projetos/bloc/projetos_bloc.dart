import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

part 'projetos_event.dart';
part 'projetos_state.dart';

class ProjetosBloc extends Bloc<ProjetosEvent, ProjetosState> {
  ProjetosBloc(ProjetosRepository repository) : super(ProjetosInitial()) {
    on<FetchProjetos>((event, emit) async {
      emit(ProjetosLoading());
      try {
        final projetos = await repository.fetch();
        emit(ProjetosLoaded(projetos));
      } catch (e) {
        emit(ProjetosError(e.toString()));
      }
    });
  }
}
