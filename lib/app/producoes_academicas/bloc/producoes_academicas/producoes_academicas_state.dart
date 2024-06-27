part of 'producoes_academicas_bloc.dart';

sealed class ProducoesAcademicasState extends Equatable {
  const ProducoesAcademicasState();

  @override
  List<Object> get props => [];
}

final class ProducoesAcademicasInitial extends ProducoesAcademicasState {}

final class ProducoesAcademicasLoading extends ProducoesAcademicasState {}

final class ProducoesAcademicasLoaded extends ProducoesAcademicasState {
  const ProducoesAcademicasLoaded(this.producoesAcademicas);
  final List<ProducaoAcademica> producoesAcademicas;

  @override
  List<Object> get props => [producoesAcademicas];
}

final class ProducoesAcademicasError extends ProducoesAcademicasState {
  const ProducoesAcademicasError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
