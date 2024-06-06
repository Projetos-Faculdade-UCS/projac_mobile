part of 'pesquisador_bloc.dart';

sealed class PesquisadorEvent extends Equatable {
  const PesquisadorEvent();

  @override
  List<Object> get props => [];
}

final class PesquisadorLoad extends PesquisadorEvent {
  const PesquisadorLoad(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
