import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/_widgets/error_message.dart';
import 'package:projac_mobile/app/_widgets/search_action_button.dart';
import 'package:projac_mobile/app/projetos/bloc/list/projetos_list_bloc.dart';
import 'package:projac_mobile/app/projetos/get_it.dart';
import 'package:projac_mobile/app/projetos/projetos_search_delegate.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';

class ProjetosPage extends StatefulWidget {
  const ProjetosPage({super.key = const Key('projetos_page')});

  @override
  State<ProjetosPage> createState() => _ProjetosPageState();
}

class _ProjetosPageState extends State<ProjetosPage> {
  @override
  void initState() {
    setupProjetosListGetIt();
    super.initState();
  }

  @override
  void dispose() {
    disposeProjetosListGetIt();
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
              delegate: projetosListGetIt<ProjetosSearchDelegate>(),
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
              return ProjetosListView(projetos: state.projetos);
            }
            return const ErrorMessage(error: 'Erro ao carregar projetos');
          },
        ),
      ),
    );
  }
}
