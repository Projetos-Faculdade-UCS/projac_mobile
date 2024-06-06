import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores/pesquisadores_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/get_it.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisadores/pesquisadores_widget.dart';

class PesquisadoresPage extends StatefulWidget {
  const PesquisadoresPage({super.key});

  @override
  State<PesquisadoresPage> createState() => _PesquisadoresPageState();
}

class _PesquisadoresPageState extends State<PesquisadoresPage> {
  @override
  void initState() {
    super.initState();
    setupPesquisadoresGetIt();
  }

  @override
  void dispose() {
    disposePesquisadoresGetIt();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pesquisadoresGetIt.getAsync<PesquisadoresBloc>(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return BlocProvider(
          create: (context) => snapshot.data!..add(const PesquisadoresLoad()),
          child: Scaffold(
            appBar: const CustomAppBar(
              title: Text('Pesquisadores'),
            ),
            body: BlocBuilder<PesquisadoresBloc, PesquisadoresState>(
              builder: (context, state) {
                if (state is PesquisadoresLoaded) {
                  return PesquisadoresWidget(
                    pesquisadores: state.pesquisadores,
                  );
                }

                if (state is PesquisadoresLoading) {
                  return PesquisadoresWidget.skeleton;
                }

                return const Center(
                  child: Text('Erro ao carregar pesquisadores'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
