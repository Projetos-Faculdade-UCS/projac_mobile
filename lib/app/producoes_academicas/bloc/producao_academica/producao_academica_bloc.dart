import 'package:acadion/app/producoes_academicas/bloc/producoes_academicas_repository.dart';
import 'package:acadion/core/api/models/producao_academica.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'producao_academica_event.dart';
part 'producao_academica_state.dart';

class ProducaoAcademicaBloc
    extends Bloc<ProducaoAcademicaEvent, ProducaoAcademicaState> {
  ProducaoAcademicaBloc(
    ProducoesAcademicasRepository repository,
  ) : super(ProducaoAcademicaInitial()) {
    on<FetchProducaoAcademica>((event, emit) async {
      emit(ProducaoAcademicaLoading());
      try {
        final producaoAcademica = await repository.get(event.id);
        emit(ProducaoAcademicaLoaded(producaoAcademica));
        // ignore
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        emit(ProducaoAcademicaError(e.toString()));
      }
    });
  }
}
