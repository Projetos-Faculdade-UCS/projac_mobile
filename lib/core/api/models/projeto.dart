import 'package:json_annotation/json_annotation.dart';
import 'package:projac_mobile/core/api/models/agencia_fomento.dart';
import 'package:projac_mobile/core/api/models/area.dart';
import 'package:projac_mobile/core/api/models/pesquisador_projeto.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';
import 'package:projac_mobile/core/api/models/valor_arrecadado.dart';

part 'projeto.g.dart';

@JsonSerializable()
class Projeto {
  Projeto({
    required this.id,
    required this.titulo,
    required this.objetivo,
    required this.dataCriacao,
    required this.valorSolicitado,
    required this.valorTotalArrecadado,
    required this.area,
    required this.producoesAcademicas,
    required this.valoresArrecadados,
    required this.subareas,
    required this.pesquisadores,
    required this.agenciasFomento,
    required this.status,
    this.descricao,
    this.dataConclusao,
  });

  factory Projeto.skeleton() => Projeto(
        id: 0,
        titulo: 'Título Qualquer',
        objetivo: 'Objetivo qualquer',
        dataCriacao: '2021-01-01',
        valorSolicitado: 0,
        valorTotalArrecadado: 0,
        area: BaseArea.skeleton(),
        producoesAcademicas: [],
        valoresArrecadados: [],
        subareas: [
          BaseArea.skeleton(),
          BaseArea.skeleton(),
        ],
        pesquisadores: [],
        agenciasFomento: [],
        status: StatusProjeto.emAndamento,
      );

  factory Projeto.fromJson(Map<String, dynamic> json) =>
      _$ProjetoFromJson(json);

  final int id;
  final String titulo;
  final String objetivo;
  final String dataCriacao;
  final double valorSolicitado;
  final String? descricao;
  final String? dataConclusao;
  final double valorTotalArrecadado;
  final BaseArea area;
  final List<ProducaoAcademica> producoesAcademicas;
  final List<ValorArrecadado> valoresArrecadados;
  final List<BaseArea> subareas;
  final List<PesquisadorProjeto> pesquisadores;
  final List<AgenciaFomento> agenciasFomento;

  @StatusProjetoConverter()
  final StatusProjeto status;

  Map<String, dynamic> toJson() => _$ProjetoToJson(this);
}

class StatusProjetoConverter implements JsonConverter<StatusProjeto, String> {
  const StatusProjetoConverter();

  @override
  StatusProjeto fromJson(String json) {
    switch (json) {
      case 'EM_ANDAMENTO':
        return StatusProjeto.emAndamento;
      case 'CONCLUIDO':
        return StatusProjeto.concluido;
      case 'CANCELADO':
        return StatusProjeto.cancelado;
      default:
        throw ArgumentError.value(json);
    }
  }

  @override
  String toJson(StatusProjeto object) {
    switch (object) {
      case StatusProjeto.emAndamento:
        return 'EM_ANDAMENTO';
      case StatusProjeto.concluido:
        return 'CONCLUIDO';
      case StatusProjeto.cancelado:
        return 'CANCELADO';
    }
  }
}

enum StatusProjeto {
  emAndamento,
  concluido,
  cancelado,
}

extension StatusProjetoExtension on StatusProjeto {
  String get name {
    switch (this) {
      case StatusProjeto.emAndamento:
        return 'Em andamento';
      case StatusProjeto.concluido:
        return 'Concluído';
      case StatusProjeto.cancelado:
        return 'Cancelado';
    }
  }
}
