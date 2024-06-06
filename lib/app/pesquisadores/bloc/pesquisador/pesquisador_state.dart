part of 'pesquisador_bloc.dart';

sealed class PesquisadorState extends Equatable {
  const PesquisadorState();

  @override
  List<Object> get props => [];
}

final class PesquisadorInitial extends PesquisadorState {}

final class PesquisadorLoading extends PesquisadorState {}

final class PesquisadorLoaded extends PesquisadorState {
  const PesquisadorLoaded(this.pesquisador);
  final Pesquisador pesquisador;

  @override
  List<Object> get props => [pesquisador];
}

final class PesquisadorError extends PesquisadorState {
  const PesquisadorError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
