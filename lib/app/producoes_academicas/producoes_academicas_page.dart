import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/_widgets/search_action_button.dart';
import 'package:acadion/app/producoes_academicas/bloc/producoes_academicas/producoes_academicas_bloc.dart';
import 'package:acadion/app/producoes_academicas/bloc/producoes_academicas_repository.dart';
import 'package:acadion/app/producoes_academicas/get_it.dart';
import 'package:acadion/app/producoes_academicas/widgets/producoes_academicas_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProducoesAcademicasPage extends StatefulWidget {
  const ProducoesAcademicasPage({super.key});

  @override
  State<ProducoesAcademicasPage> createState() =>
      _ProducoesAcademicasPageState();
}

class _ProducoesAcademicasPageState extends State<ProducoesAcademicasPage> {
  late final bool _disposeGetIt;
  late final ProducoesAcademicasBloc bloc;

  @override
  void initState() {
    super.initState();
    _disposeGetIt = setupProducoesAcademicasGetIt();
    bloc = producoesAcademicasGetIt.get<ProducoesAcademicasBloc>();
  }

  @override
  void dispose() {
    disposeProducoesAcademicasGetIt(dispose: _disposeGetIt);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(FetchProducoesAcademicas()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text('Produções Acadêmicas'),
          actions: [
            SearchActionButton(
              searchFieldLabel: 'Buscar produções',
              repository:
                  producoesAcademicasGetIt.get<ProducoesAcademicasRepository>(),
              resultBuilder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar produções acadêmicas'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ProducoesAcademicasList.skeleton;
                }

                return ProducoesAcademicasList(
                  producoesAcademicas: snapshot.data!,
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ProducoesAcademicasBloc, ProducoesAcademicasState>(
          builder: (context, state) {
            if (state is ProducoesAcademicasLoaded) {
              return ProducoesAcademicasList(
                producoesAcademicas: state.producoesAcademicas,
              );
            }

            if (state is ProducoesAcademicasError) {
              return Center(
                child: Text(state.error),
              );
            }

            return ProducoesAcademicasList.skeleton;
          },
        ),
      ),
    );
  }
}
