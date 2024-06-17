import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/producoes_academicas/bloc/producoes_academicas_repository.dart';

part 'producao_academica_event.dart';
part 'producao_academica_state.dart';

class ProducaoAcademicaBloc
    extends Bloc<ProducaoAcademicaEvent, ProducaoAcademicaState> {
  ProducaoAcademicaBloc(
    ProducoesAcademicasRepository repository,
  ) : super(ProducaoAcademicaInitial()) {
    on<ProducaoAcademicaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
