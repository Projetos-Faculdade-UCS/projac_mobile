part of 'projetos_list_bloc.dart';

sealed class ProjetosListEvent extends Equatable {
  const ProjetosListEvent();

  @override
  List<Object> get props => [];
}

class FetchProjetosList extends ProjetosListEvent {}
