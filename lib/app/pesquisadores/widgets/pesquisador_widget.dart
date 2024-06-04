import 'package:flutter/material.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';

class PesquisadorWidget extends StatelessWidget {
  const PesquisadorWidget({
    required this.pesquisador,
    super.key,
  });

  final Pesquisador pesquisador;

  static Widget get skeleton {
    final pesquisador = Pesquisador.skeleton();

    return PesquisadorWidget(pesquisador: pesquisador);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
