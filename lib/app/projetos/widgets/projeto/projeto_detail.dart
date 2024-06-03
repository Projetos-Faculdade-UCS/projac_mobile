import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/_widgets/custom_badge.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_section.dart';
import 'package:projac_mobile/app/_widgets/outlined_badge.dart';
import 'package:projac_mobile/app/_widgets/projeto_status_extension.dart';
import 'package:projac_mobile/app/projetos/bloc/projeto/projeto_bloc.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:readmore/readmore.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProjetoDetail extends StatelessWidget {
  const ProjetoDetail({
    required this.projeto,
    super.key,
  });
  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Adjust this based on the number of tabs you need
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
            isScrollable: true,
            tabs: [
              const Tab(
                text: 'Geral',
                icon: Icon(
                  Ionicons.information_circle_outline,
                ),
              ),
              const Tab(
                text: 'Pesquisadores',
                icon: Icon(
                  Ionicons.person_outline,
                ),
              ),
              const Tab(
                text: 'Financeiro',
                icon: Icon(
                  Ionicons.cash_outline,
                ),
              ),
              if (projeto.producoesAcademicas.isNotEmpty)
                const Tab(
                  text: 'Produções',
                  icon: Icon(
                    Ionicons.document_outline,
                  ),
                ),
              if (projeto.agenciasFomento.isNotEmpty)
                const Tab(
                  text: 'Agências de Fomento',
                  icon: Icon(
                    Ionicons.business_outline,
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGeralTab(),
            _buildPesquisadoresTab(),
            _buildFinanceiroTab(),
            if (projeto.producoesAcademicas.isNotEmpty)
              _buildProducoesAcademicasTab(),
            if (projeto.agenciasFomento.isNotEmpty) _buildAgenciasFomentoTab(),
          ],
        ),
      ),
    );
  }

  Widget get area {
    return DetailField(
      icon: Ionicons.book_outline,
      title: 'Área',
      child: Row(
        children: [
          CustomBadge(
            color: projeto.area.color,
            boxShadow: [
              BoxShadow(
                color: projeto.area.color.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            child: Text(projeto.area.nome),
          ),
        ],
      ),
    );
  }

  List<Widget> get subareas {
    return [
      if (projeto.subareas.isNotEmpty)
        DetailField(
          icon: Ionicons.book_outline,
          title: 'Área e Subáreas',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CustomBadge(
                color: projeto.area.color,
                boxShadow: [
                  BoxShadow(
                    color: projeto.area.color.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: Text(projeto.area.nome),
              ),
              ...projeto.subareas.map(
                (subarea) => OutlinedBadge(
                  color: subarea.color,
                  boxShadow: [
                    BoxShadow(
                      color: subarea.color.withOpacity(0.5),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  child: Text(subarea.nome),
                ),
              ),
            ],
          ),
        ),
    ];
  }

  Widget _buildGeralTab() {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: [
        DetailField(
          leading: Icon(
            projeto.status.iconData,
            color: projeto.status.color,
          ),
          title: 'Status',
          child: Text(projeto.status.name),
        ),
        DetailField(
          icon: Ionicons.flag_outline,
          title: 'Objetivo',
          child: Text(projeto.objetivo),
        ),
        // area,
        ...subareas,
        if (projeto.descricao != null)
          DetailField(
            icon: Ionicons.document_outline,
            title: 'Descrição',
            child: ReadMoreText(
              projeto.descricao!,
              trimLines: 3,
              trimMode: TrimMode.Line,
              trimCollapsedText: '\nVer mais',
              trimExpandedText: '\nVer menos',
            ),
          ),
        DetailField(
          icon: Ionicons.calendar_outline,
          title: 'Data de Criação',
          child: Text(projeto.dataCriacao),
        ),
        if (projeto.dataConclusao != null)
          DetailField(
            icon: Ionicons.calendar_outline,
            title: 'Data de Conclusão',
            child: Text(projeto.dataConclusao!),
          ),
      ],
    );
  }

  Widget _buildFinanceiroTab() {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: [
        DetailField(
          title: 'Valor Solicitado',
          icon: Ionicons.cash_outline,
          child: Text('R\$ ${projeto.valorSolicitado}'),
        ),
        DetailField(
          title: 'Valor Arrecadado',
          icon: Ionicons.cash_outline,
          child: Text('R\$ ${projeto.valorTotalArrecadado}'),
        ),
        if (projeto.valoresArrecadados.isNotEmpty)
          DetailSection(
            title: 'Valores Arrecadados',
            children: projeto.valoresArrecadados
                .map(
                  (valor) => DetailField(
                    icon: Ionicons.cash_outline,
                    title: 'R\$ ${valor.valor}',
                    child: Text(
                      valor.descricao,
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  Widget _buildPesquisadoresTab() {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: projeto.pesquisadores
          .map(
            (pesquisador) => DetailField(
              icon: Ionicons.person_outline,
              title: pesquisador.nome,
              child: Text(pesquisador.cargo),
            ),
          )
          .toList(),
    );
  }

  Widget _buildProducoesAcademicasTab() {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: projeto.producoesAcademicas
          .map(
            (producao) => DetailField(
              icon: Ionicons.document_outline,
              title: producao.titulo,
              child: Text(producao.tipo),
            ),
          )
          .toList(),
    );
  }

  Widget _buildAgenciasFomentoTab() {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: projeto.agenciasFomento
          .map(
            (agencia) => DetailField(
              icon: Ionicons.business_outline,
              title: agencia.nome,
              child: Text(agencia.sigla),
            ),
          )
          .toList(),
    );
  }
}
