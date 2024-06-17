import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/producoes_academicas/bloc/producoes_academicas_repository.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';

part 'producoes_academicas_event.dart';
part 'producoes_academicas_state.dart';

class ProducoesAcademicasBloc
    extends Bloc<ProducoesAcademicasEvent, ProducoesAcademicasState> {
  ProducoesAcademicasBloc(
    ProducoesAcademicasRepository repository,
  ) : super(ProducoesAcademicasInitial()) {
    on<FetchProducoesAcademicas>((event, emit) async {
      emit(ProducoesAcademicasLoading());
      try {
        final producoesAcademicas = await repository.fetch();
        emit(ProducoesAcademicasLoaded(producoesAcademicas));
      } catch (e) {
        emit(ProducoesAcademicasError(e.toString()));
        rethrow;
      }
    });
  }
}
