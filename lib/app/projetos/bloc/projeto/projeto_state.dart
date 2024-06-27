part of 'projeto_bloc.dart';

sealed class ProjetoState extends Equatable {
  const ProjetoState();

  @override
  List<Object> get props => [];
}

final class ProjetoInitial extends ProjetoState {}

final class ProjetoLoading extends ProjetoState {}

final class ProjetoLoaded extends ProjetoState {
  const ProjetoLoaded(this.projeto);
  final Projeto projeto;

  @override
  List<Object> get props => [projeto];
}

final class ProjetoError extends ProjetoState {
  const ProjetoError(this.error);
  final Object error;

  @override
  List<Object> get props => [error];
}
