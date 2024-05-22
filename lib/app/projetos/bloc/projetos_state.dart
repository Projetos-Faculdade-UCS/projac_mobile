part of 'projetos_bloc.dart';

sealed class ProjetosState extends Equatable {
  const ProjetosState();

  @override
  List<Object> get props => [];
}

final class ProjetosInitial extends ProjetosState {}

final class ProjetosLoading extends ProjetosState {}

final class ProjetosLoaded extends ProjetosState {
  const ProjetosLoaded(this.projetos);
  final List<Projeto> projetos;

  @override
  List<Object> get props => [projetos];
}

final class ProjetosError extends ProjetosState {
  const ProjetosError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
