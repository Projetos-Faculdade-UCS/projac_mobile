part of 'producao_academica_bloc.dart';

sealed class ProducaoAcademicaEvent extends Equatable {
  const ProducaoAcademicaEvent();

  @override
  List<Object> get props => [];
}

final class FetchProducaoAcademica extends ProducaoAcademicaEvent {
  const FetchProducaoAcademica(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
