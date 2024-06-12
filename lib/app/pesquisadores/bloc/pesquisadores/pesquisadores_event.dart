part of 'pesquisadores_bloc.dart';

sealed class PesquisadoresEvent extends Equatable {
  const PesquisadoresEvent();

  @override
  List<Object> get props => [];
}

class PesquisadoresLoad extends PesquisadoresEvent {
  const PesquisadoresLoad();
}
