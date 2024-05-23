import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/_widgets/error_message.dart';
import 'package:projac_mobile/app/_widgets/loading_indicator.dart';
import 'package:projac_mobile/app/_widgets/search_action_button.dart';
import 'package:projac_mobile/app/projetos/bloc/projetos_bloc.dart';
import 'package:projac_mobile/app/projetos/get_it.dart';
import 'package:projac_mobile/app/projetos/projetos_search_delegate.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';

class ProjetosPage extends StatefulWidget {
  const ProjetosPage({super.key});

  @override
  State<ProjetosPage> createState() => _ProjetosPageState();
}

class _ProjetosPageState extends State<ProjetosPage> {
  @override
  void initState() {
    setupProjetosGetIt();
    super.initState();
  }

  @override
  void dispose() {
    disposeProjetosGetIt();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => projetosGetIt<ProjetosBloc>()..add(FetchProjetos()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text('Projetos'),
          actions: [
            SearchActionButton(
              delegate: projetosGetIt<ProjetosSearchDelegate>(),
            ),
          ],
        ),
        body: BlocBuilder<ProjetosBloc, ProjetosState>(
          builder: (context, state) {
            if (state is ProjetosError) {
              return ErrorMessage(error: state.error);
            }

            if (state is ProjetosLoading || state is ProjetosInitial) {
              return const LoadingIndicator();
            }
            if (state is ProjetosLoaded) {
              return ProjetosListView(projetos: state.projetos);
            }
            return const ErrorMessage(error: 'Erro ao carregar projetos');
          },
        ),
      ),
    );
  }
}
