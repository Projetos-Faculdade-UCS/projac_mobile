part of 'pesquisadores_bloc.dart';

sealed class PesquisadoresState extends Equatable {
  const PesquisadoresState();

  @override
  List<Object> get props => [];
}

final class PesquisadoresInitial extends PesquisadoresState {}

final class PesquisadoresLoading extends PesquisadoresState {}

final class PesquisadoresLoaded extends PesquisadoresState {
  const PesquisadoresLoaded(this.pesquisadores);
  final List<Pesquisador> pesquisadores;

  @override
  List<Object> get props => [pesquisadores];
}

final class PesquisadoresError extends PesquisadoresState {
  const PesquisadoresError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
