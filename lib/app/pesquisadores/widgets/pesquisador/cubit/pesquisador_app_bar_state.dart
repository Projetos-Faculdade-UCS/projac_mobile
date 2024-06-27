part of 'pesquisador_app_bar_cubit.dart';

sealed class PesquisadorAppBarState extends Equatable {
  const PesquisadorAppBarState({
    this.showPesquisador = false,
  });

  final bool showPesquisador;

  @override
  List<Object> get props => [showPesquisador];
}

final class PesquisadorAppBarInitial extends PesquisadorAppBarState {}

final class PesquisadorAppBarShow extends PesquisadorAppBarState {
  const PesquisadorAppBarShow(this.title) : super(showPesquisador: true);

  final String title;

  @override
  List<Object> get props => [showPesquisador, title];
}

final class PesquisadorAppBarHide extends PesquisadorAppBarState {
  const PesquisadorAppBarHide() : super(showPesquisador: false);
}
