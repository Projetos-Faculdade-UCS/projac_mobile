import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/projetos/bloc/projetos_bloc.dart';

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
              return Center(
                child: Text('Erro ao carregar projetos: ${state.error}'),
              );
            }

            if (state is ProjetosLoading || state is ProjetosInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProjetosLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.projetos.length,
                itemBuilder: (context, index) {
                  final projeto = state.projetos[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(projeto.titulo),
                      subtitle: Text(projeto.objetivo),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text('Erro ao carregar projetos'),
            );
          },
        ),
      ),
    );
  }
}
