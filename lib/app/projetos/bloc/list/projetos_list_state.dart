part of 'projetos_list_bloc.dart';

sealed class ProjetosListState extends Equatable {
  const ProjetosListState();

  @override
  List<Object> get props => [];
}

final class ProjetosListInitial extends ProjetosListState {}

final class ProjetosListLoading extends ProjetosListState {}

final class ProjetosListLoaded extends ProjetosListState {
  const ProjetosListLoaded(this.projetos);
  final List<ProjetoList> projetos;

  @override
  List<Object> get props => [projetos];
}

final class ProjetosListError extends ProjetosListState {
  const ProjetosListError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
