import 'package:acadion/app/projetos/repositories/projetos_repository.dart';
import 'package:acadion/core/api/models/projeto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
