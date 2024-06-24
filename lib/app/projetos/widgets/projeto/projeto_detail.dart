import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/producoes_academicas/widgets/producoes_academicas_list.dart';
import 'package:acadion/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:acadion/app/projetos/widgets/projeto/tabs/agencias_fomento_tab.dart';
import 'package:acadion/app/projetos/widgets/projeto/tabs/financeiro_tab.dart';
import 'package:acadion/app/projetos/widgets/projeto/tabs/geral_tab.dart';
import 'package:acadion/app/projetos/widgets/projeto/tabs/pesquisadores_tab.dart';
import 'package:acadion/core/api/models/projeto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjetoDetail extends StatelessWidget {
  const ProjetoDetail({
    required this.projeto,
    super.key,
  });
  final Projeto projeto;

  static Widget get skeleton {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!.withAlpha(100),
        highlightColor: Colors.white.withAlpha(100),
      ),
      child: ProjetoDetail(projeto: Projeto.skeleton()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = _buildTabs(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: BlocBuilder<ProjetoBloc, ProjetoState>(
            builder: (context, state) {
              if (state is ProjetoLoaded) {
                return Text(state.projeto.titulo);
              }

              return const Text('Projeto');
            },
          ),
          bottom: TabBar(
            enableFeedback: true,
            isScrollable: true,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: _buildTabViews(),
        ),
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context) {
    return [
      const Tab(text: 'Geral', icon: Icon(Ionicons.information_circle_outline)),
      const Tab(text: 'Pesquisadores', icon: Icon(Ionicons.person_outline)),
      const Tab(text: 'Financeiro', icon: Icon(Ionicons.cash_outline)),
      if (projeto.producoesAcademicas.isNotEmpty)
        const Tab(
          text: 'Produções Acadêmicas',
          icon: Icon(Ionicons.document_outline),
        ),
      if (projeto.agenciasFomento.isNotEmpty)
        const Tab(
          text: 'Agências de Fomento',
          icon: Icon(Ionicons.business_outline),
        ),
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      GeralTab(projeto: projeto),
      PesquisadoresTab(projeto: projeto),
      FinanceiroTab(projeto: projeto),
      if (projeto.producoesAcademicas.isNotEmpty)
        ProducoesAcademicasList(
          producoesAcademicas: projeto.producoesAcademicas,
        ),
      if (projeto.agenciasFomento.isNotEmpty)
        AgenciasFomentoTab(projeto: projeto),
    ];
  }
}
