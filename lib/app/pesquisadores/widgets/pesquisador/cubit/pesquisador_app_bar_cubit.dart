import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pesquisador_app_bar_state.dart';

class PesquisadorAppBarCubit extends Cubit<PesquisadorAppBarState> {
  PesquisadorAppBarCubit() : super(PesquisadorAppBarInitial());

  void showPesquisador(String title) {
    emit(PesquisadorAppBarShow(title));
  }

  void hidePesquisador() {
    emit(const PesquisadorAppBarHide());
  }
}
