import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/_widgets/error_message.dart';
import 'package:projac_mobile/app/_widgets/loading_indicator.dart';
import 'package:projac_mobile/app/_widgets/search_action_button.dart';
import 'package:projac_mobile/app/projetos/bloc/list/projetos_list_bloc.dart';
import 'package:projac_mobile/app/projetos/get_it.dart';
import 'package:projac_mobile/app/projetos/projetos_search_delegate.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';

// ignore: strict_raw_type
Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageTransition(
    type: PageTransitionType.rotate,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 500),
    reverseDuration: const Duration(milliseconds: 500),
    child: const ProjetosPage(),
    settings: settings,
  );
}

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
        ),
        body: BlocBuilder<ProjetosListBloc, ProjetosListState>(
          builder: (context, state) {
            if (state is ProjetosListError) {
              return ErrorMessage(error: state.error);
            }

            if (state is ProjetosListLoading || state is ProjetosListInitial) {
              return const LoadingIndicator();
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
