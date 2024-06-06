import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';

part 'pesquisadores_event.dart';
part 'pesquisadores_state.dart';

class PesquisadoresBloc extends Bloc<PesquisadoresEvent, PesquisadoresState> {
  PesquisadoresBloc() : super(PesquisadoresInitial()) {
    on<PesquisadoresEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
