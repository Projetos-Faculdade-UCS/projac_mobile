import 'package:acadion/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:acadion/app/projetos/get_it.dart';
import 'package:acadion/app/projetos/widgets/projeto/projeto_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

class ProjetoPage extends StatefulWidget {
  const ProjetoPage({super.key});

  @override
  State<ProjetoPage> createState() => _ProjetoPageState();
}

class _ProjetoPageState extends State<ProjetoPage> {
  late final int id;
  late final bool disposeGetIt;

  @override
  void initState() {
    super.initState();
    disposeGetIt = setupProjetoGetIt();
    id = Routefly.query['id'] as int;
  }

  @override
  void dispose() {
    disposeProjetoGetIt(dispose: disposeGetIt);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          projetoGetIt.get<ProjetoBloc>()..add(ProjetoLoad(id)),
      child: BlocBuilder<ProjetoBloc, ProjetoState>(
        builder: (context, state) {
          return Scaffold(
            body: Builder(
              builder: (context) {
                if (state is ProjetoLoaded) {
                  return ProjetoDetail(projeto: state.projeto);
                }

                if (state is ProjetoError) {
                  return Center(
                    child: Text('Erro ao carregar projeto: ${state.error}'),
                  );
                }

                if (state is ProjetoLoading) {
                  return ProjetoDetail.skeleton;
                }

                return const Center(
                  child: Text('Erro desconhecido'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
