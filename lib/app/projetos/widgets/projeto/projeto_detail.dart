import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_section.dart';
import 'package:projac_mobile/app/_widgets/outlined_badge.dart';
import 'package:projac_mobile/app/_widgets/projeto_status_extension.dart';
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
        DetailSection(
          title: 'Área e Subáreas',
          children: [
            DetailField(
              icon: Ionicons.book_outline,
              title: 'Área',
              child: Row(
                children: [
                  Badge(
                    largeSize: 24,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    label: Text(projeto.area.nome),
                    backgroundColor: projeto.area.color,
                  ),
                ],
              ),
            ),
            if (projeto.subareas.isNotEmpty)
              DetailField(
                icon: Ionicons.book_outline,
                title: 'Subáreas',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: projeto.subareas
                      .map(
                        (subarea) => OutlinedBadge(
                          color: subarea.color,
                          child: Text(subarea.nome),
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
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
        DetailSection(
          title: 'Informações Adicionais',
          children: [
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
          ],
        ),
        DetailSection(
          title: 'Pesquisadores',
          children: projeto.pesquisadores
              .map(
                (pesquisador) => DetailField(
                  icon: Ionicons.person_outline,
                  title: pesquisador.nome,
                  child: Text(pesquisador.cargo),
                ),
              )
              .toList(),
        ),
        if (projeto.producoesAcademicas.isNotEmpty)
          DetailSection(
            title: 'Produções Acadêmicas',
            children: projeto.producoesAcademicas
                .map(
                  (producao) => DetailField(
                    icon: Ionicons.document_outline,
                    title: producao.titulo,
                    child: Text(producao.tipo),
                  ),
                )
                .toList(),
          ),
        if (projeto.agenciasFomento.isNotEmpty)
          DetailSection(
            title: 'Agências de Fomento',
            children: projeto.agenciasFomento
                .map(
                  (agencia) => DetailField(
                    icon: Ionicons.business_outline,
                    title: agencia.nome,
                    child: Text(agencia.sigla),
                  ),
                )
                .toList(),
          ),
        if (projeto.valoresArrecadados.isNotEmpty)
          DetailSection(
            title: 'Valores Arrecadados',
            children: projeto.valoresArrecadados
                .map(
                  (valor) => DetailField(
                    icon: Ionicons.cash_outline,
                    title: valor.descricao,
                    child: Text('R\$ ${valor.valor}'),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
