import 'dart:async';

import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/_widgets/search_action_button.dart';
import 'package:acadion/app/pesquisadores/bloc/pesquisadores/pesquisadores_bloc.dart';
import 'package:acadion/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:acadion/app/pesquisadores/get_it.dart';
import 'package:acadion/app/pesquisadores/widgets/pesquisadores/pesquisadores_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PesquisadoresPage extends StatefulWidget {
  const PesquisadoresPage({super.key});

  @override
  State<PesquisadoresPage> createState() => _PesquisadoresPageState();
}

class _PesquisadoresPageState extends State<PesquisadoresPage> {
  late final bool disposeGetIt;

  @override
  void initState() {
    super.initState();
    disposeGetIt = setupPesquisadoresGetIt();
  }

  @override
  void dispose() {
    unawaited(
      disposePesquisadoresGetIt(
        dispose: disposeGetIt,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          pesquisadoresGetIt.get<PesquisadoresBloc>()
            ..add(const PesquisadoresLoad()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text('Pesquisadores'),
          actions: [
            SearchActionButton(
              searchFieldLabel: 'Buscar pesquisadores',
              repository: pesquisadoresGetIt<PesquisadoresRepository>(),
              resultBuilder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar pesquisadores'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return PesquisadoresWidget.skeleton;
                }

                return PesquisadoresWidget(
                  pesquisadores: snapshot.data!,
                );
              },
            ),
          ],
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
  }
}
