import 'package:acadion/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:acadion/core/api/models/pesquisador_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pesquisador_event.dart';
part 'pesquisador_state.dart';

class PesquisadorBloc extends Bloc<PesquisadorEvent, PesquisadorState> {
  PesquisadorBloc(PesquisadoresRepository repository)
      : super(PesquisadorInitial()) {
    on<PesquisadorLoad>((event, emit) async {
      emit(PesquisadorLoading());

      try {
        final pesquisador = await repository.getPesquisador(event.id);
        emit(PesquisadorLoaded(pesquisador));
      } catch (e) {
        emit(PesquisadorError(e.toString()));
        rethrow;
      }
    });
  }
}
