import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

part 'projeto_event.dart';
part 'projeto_state.dart';

class ProjetoBloc extends Bloc<ProjetoEvent, ProjetoState> {
  ProjetoBloc(ProjetosRepository repository) : super(ProjetoInitial()) {
    on<ProjetoLoad>((event, emit) async {
      emit(ProjetoLoading());
      try {
        final projeto = await repository.get(event.id);
        emit(ProjetoLoaded(projeto));
      } catch (e) {
        emit(ProjetoError(e));
        rethrow;
      }
    });
  }
}
