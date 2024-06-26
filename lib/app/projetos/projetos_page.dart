import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/_widgets/error_message.dart';
import 'package:acadion/app/_widgets/search_action_button.dart';
import 'package:acadion/app/projetos/bloc/list/projetos_list_bloc.dart';
import 'package:acadion/app/projetos/get_it.dart';
import 'package:acadion/app/projetos/repositories/projetos_repository.dart';
import 'package:acadion/app/projetos/widgets/projeto_list_tile/projeto_list_tile.dart';
import 'package:acadion/app/projetos/widgets/projetos_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjetosPage extends StatefulWidget {
  const ProjetosPage({super.key = const Key('projetos_page')});

  @override
  State<ProjetosPage> createState() => _ProjetosPageState();
}

class _ProjetosPageState extends State<ProjetosPage> {
  late final bool disposeGetIt;

  @override
  void initState() {
    disposeGetIt = setupProjetosListGetIt();
    super.initState();
  }

  @override
  void dispose() {
    disposeProjetosListGetIt(
      dispose: disposeGetIt,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          projetosListGetIt<ProjetosListBloc>()..add(FetchProjetosList()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text('Projetos'),
          actions: [
            SearchActionButton(
              searchFieldLabel: 'Buscar projetos',
              repository: projetosListGetIt<ProjetosRepository>(),
              resultBuilder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ErrorMessage(error: snapshot.error.toString());
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ProjetosListView.skeleton;
                }
                return ProjetosListView(
                  projetos: snapshot.data!,
                  itemBuilder: (context, index) {
                    final projeto = snapshot.data![index];
                    return ProjetoListTile(
                      projeto: projeto,
                      isLast: index == snapshot.data!.length - 1,
                    );
                  },
                );
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Projeto',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProjetosListBloc, ProjetosListState>(
          builder: (context, state) {
            if (state is ProjetosListError) {
              return ErrorMessage(error: state.error);
            }

            if (state is ProjetosListLoading || state is ProjetosListInitial) {
              return ProjetosListView.skeleton;
            }
            if (state is ProjetosListLoaded) {
              return ProjetosListView(
                projetos: state.projetos,
                itemBuilder: (context, index) {
                  final projeto = state.projetos[index];
                  return ProjetoListTile(
                    projeto: projeto,
                    isLast: index == state.projetos.length - 1,
                  );
                },
              );
            }
            return const ErrorMessage(error: 'Erro ao carregar projetos');
          },
        ),
      ),
    );
  }
}
