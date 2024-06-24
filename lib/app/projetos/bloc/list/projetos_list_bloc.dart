import 'package:acadion/app/projetos/repositories/projetos_repository.dart';
import 'package:acadion/core/api/models/projeto_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'projetos_list_event.dart';
part 'projetos_list_state.dart';

class ProjetosListBloc extends Bloc<ProjetosListEvent, ProjetosListState> {
  ProjetosListBloc(ProjetosRepository repository)
      : super(ProjetosListInitial()) {
    on<FetchProjetosList>((event, emit) async {
      emit(ProjetosListLoading());
      try {
        final projetos = await repository.fetch();
        emit(ProjetosListLoaded(projetos));
      } catch (e) {
        emit(ProjetosListError(e.toString()));
        rethrow;
      }
    });
  }
}
