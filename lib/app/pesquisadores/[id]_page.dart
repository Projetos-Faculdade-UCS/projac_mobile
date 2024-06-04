import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/get_it.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PesquisadorPage extends StatefulWidget {
  const PesquisadorPage({super.key});

  @override
  State<PesquisadorPage> createState() => _PesquisadorPageState();
}

class _PesquisadorPageState extends State<PesquisadorPage> {
  @override
  void initState() {
    super.initState();
    setupPesquisadorGetIt();
  }

  @override
  void dispose() {
    disposePesquisadorGetIt();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = Routefly.query['id'] as int;
    return BlocProvider(
      create: (context) => PesquisadorBloc()..add(PesquisadorLoad(id)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: BlocBuilder<PesquisadorBloc, PesquisadorState>(
            builder: (context, state) {
              if (state is PesquisadorLoaded) {
                final nomeCompleto =
                    '${state.pesquisador.nome} ${state.pesquisador.sobrenome}';
                return Text(nomeCompleto);
              }

              if (state is PesquisadorError) {
                return const Text('Erro ao carregar pesquisador');
              }

              return Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: Colors.grey[300]!.withOpacity(.3),
                  highlightColor: Colors.grey[100]!.withOpacity(.5),
                ),
                textBoneBorderRadius:
                    const TextBoneBorderRadius.fromHeightFactor(.2),
                child: Text(
                  BoneMock.fullName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        body: Center(
          child: Text('PesquisadorPage $id'),
        ),
      ),
    );
  }
}
