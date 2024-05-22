import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/_widgets/error_message.dart';
import 'package:projac_mobile/app/_widgets/loading_indicator.dart';
import 'package:projac_mobile/app/projetos/bloc/projetos_bloc.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';

class ProjetosPage extends StatelessWidget {
  const ProjetosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Projetos'),
      ),
      body: BlocProvider(
        create: (context) => ProjetosBloc()..add(FetchProjetos()),
        child: BlocBuilder<ProjetosBloc, ProjetosState>(
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
