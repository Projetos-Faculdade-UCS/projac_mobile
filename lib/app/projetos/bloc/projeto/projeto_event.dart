part of 'projeto_bloc.dart';

sealed class ProjetoEvent extends Equatable {
  const ProjetoEvent();

  @override
  List<Object> get props => [];
}

final class ProjetoLoad extends ProjetoEvent {
  const ProjetoLoad(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
