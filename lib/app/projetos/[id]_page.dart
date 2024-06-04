import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:projac_mobile/app/projetos/get_it.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto/projeto_detail.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjetoPage extends StatelessWidget {
  const ProjetoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Routefly.query['id'] as int;
    return BlocProvider(
      create: (context) => projetosGetIt<ProjetoBloc>()..add(ProjetoLoad(id)),
      child: BlocBuilder<ProjetoBloc, ProjetoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: state is! ProjetoLoaded
                ? CustomAppBar(
                    title: Skeletonizer(
                      effect: ShimmerEffect(
                        baseColor: Colors.grey[300]!.withOpacity(.3),
                        highlightColor: Colors.grey[100]!.withOpacity(.5),
                      ),
                      textBoneBorderRadius:
                          const TextBoneBorderRadius.fromHeightFactor(.2),
                      child: const Text(
                        'Title For The Project',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : null,
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
