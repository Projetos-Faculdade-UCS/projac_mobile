import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/_widgets/custom_skeletonizer.dart';
import 'package:acadion/app/producoes_academicas/bloc/producao_academica/producao_academica_bloc.dart';
import 'package:acadion/app/producoes_academicas/get_it.dart';
import 'package:acadion/app/producoes_academicas/widgets/detail/producao_academica_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

class ProducaoAcademicaPage extends StatefulWidget {
  const ProducaoAcademicaPage({super.key});

  @override
  State<ProducaoAcademicaPage> createState() => _ProducaoAcademicaPageState();
}

class _ProducaoAcademicaPageState extends State<ProducaoAcademicaPage> {
  late final bool _disposeGetIt;
  late final ProducaoAcademicaBloc bloc;
  late final int id = Routefly.query['id'] as int;

  @override
  void initState() {
    super.initState();
    _disposeGetIt = setupProducaoAcademicaGetIt();
    bloc = producaoAcademicaGetIt.get();
  }

  @override
  void dispose() {
    disposeProducaoAcademicaGetIt(dispose: _disposeGetIt);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(FetchProducaoAcademica(id)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: BlocBuilder<ProducaoAcademicaBloc, ProducaoAcademicaState>(
            builder: (context, state) {
              if (state is ProducaoAcademicaLoaded) {
                return Text(state.producaoAcademica.titulo);
              }

              return const CustomSkeletonizer(
                child: Text('Produção Acadêmica'),
              );
            },
          ),
        ),
        body: BlocBuilder<ProducaoAcademicaBloc, ProducaoAcademicaState>(
          builder: (context, state) {
            if (state is ProducaoAcademicaLoaded) {
              return ProducaoAcademicaDetail(
                producaoAcademica: state.producaoAcademica,
              );
            }

            return ProducaoAcademicaDetail.skeleton;
          },
        ),
      ),
    );
  }
}
