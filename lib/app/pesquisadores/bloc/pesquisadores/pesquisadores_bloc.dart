import 'package:acadion/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:acadion/core/api/models/pesquisador_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pesquisadores_event.dart';
part 'pesquisadores_state.dart';

class PesquisadoresBloc extends Bloc<PesquisadoresEvent, PesquisadoresState> {
  PesquisadoresBloc(PesquisadoresRepository repository)
      : super(PesquisadoresInitial()) {
    on<PesquisadoresLoad>((event, emit) async {
      emit(PesquisadoresLoading());
      try {
        final pesquisadores = await repository.getPesquisadores();
        emit(PesquisadoresLoaded(pesquisadores));
      } catch (e) {
        emit(PesquisadoresError(e.toString()));
        rethrow;
      }
    });
  }
}
