import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/producoes_academicas/bloc/producoes_academicas_repository.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';

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
      } catch (e) {
        emit(ProducaoAcademicaError(e.toString()));
      }
    });
  }
}
