import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/get_it.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisador/pesquisador_widget.dart';
import 'package:routefly/routefly.dart';

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
    return FutureBuilder<PesquisadorBloc>(
      future: pesquisadorGetIt.getAsync<PesquisadorBloc>(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return BlocProvider<PesquisadorBloc>(
          create: (context) => snapshot.data!..add(PesquisadorLoad(id)),
          child: Scaffold(
            appBar: const CustomAppBar(
              title: Text('Pesquisador'),
            ),
            body: BlocBuilder<PesquisadorBloc, PesquisadorState>(
              builder: (context, state) {
                if (state is PesquisadorLoaded) {
                  return PesquisadorWidget(pesquisador: state.pesquisador);
                }

                if (state is PesquisadorError) {
                  return const Center(
                    child: Text('Erro ao carregar pesquisador'),
                  );
                }

                return PesquisadorWidget.skeleton;
              },
            ),
          ),
        );
      },
    );
  }
}
