part of 'projetos_bloc.dart';

sealed class ProjetosEvent extends Equatable {
  const ProjetosEvent();

  @override
  List<Object> get props => [];
}

class FetchProjetos extends ProjetosEvent {}
