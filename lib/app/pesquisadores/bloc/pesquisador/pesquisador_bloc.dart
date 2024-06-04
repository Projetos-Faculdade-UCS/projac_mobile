import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:projac_mobile/app/pesquisadores/get_it.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';

part 'pesquisador_event.dart';
part 'pesquisador_state.dart';

class PesquisadorBloc extends Bloc<PesquisadorEvent, PesquisadorState> {
  PesquisadorBloc() : super(PesquisadorInitial()) {
    on<PesquisadorLoad>((event, emit) async {
      emit(PesquisadorLoading());

      try {
        final repository =
            await pesquisadoresGetIt.getAsync<PesquisadoresRepository>();
        final pesquisador = await repository.getPesquisador(event.id);
        emit(PesquisadorLoaded(pesquisador));
      } catch (e) {
        emit(PesquisadorError(e.toString()));
      }
    });
  }
}
