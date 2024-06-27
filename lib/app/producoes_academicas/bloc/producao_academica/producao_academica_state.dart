part of 'producao_academica_bloc.dart';

sealed class ProducaoAcademicaState extends Equatable {
  const ProducaoAcademicaState();

  @override
  List<Object> get props => [];
}

final class ProducaoAcademicaInitial extends ProducaoAcademicaState {}

final class ProducaoAcademicaLoading extends ProducaoAcademicaState {}

final class ProducaoAcademicaLoaded extends ProducaoAcademicaState {
  const ProducaoAcademicaLoaded(this.producaoAcademica);
  final ProducaoAcademica producaoAcademica;

  @override
  List<Object> get props => [producaoAcademica];
}

final class ProducaoAcademicaError extends ProducaoAcademicaState {
  const ProducaoAcademicaError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
