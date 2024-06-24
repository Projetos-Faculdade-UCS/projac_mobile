import 'package:acadion/core/api/models/agencia_fomento.dart';
import 'package:acadion/core/api/models/area.dart';
import 'package:acadion/core/api/models/pesquisador_projeto.dart';
import 'package:acadion/core/api/models/producao_academica.dart';
import 'package:acadion/core/api/models/status_projeto.dart';
import 'package:acadion/core/api/models/valor_arrecadado.dart';
import 'package:json_annotation/json_annotation.dart';

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
        objetivo: 'Objetivo qualquer' * 3,
        dataCriacao: '2021-01-01',
        valorSolicitado: 0,
        valorTotalArrecadado: 0,
        descricao: 'Descrição qualquer de um proj' * 10,
        area: BaseArea.skeleton(),
        producoesAcademicas: [
          ProducaoAcademica.skeleton(),
          ProducaoAcademica.skeleton(),
        ],
        valoresArrecadados: [],
        subareas: [
          BaseArea.skeleton(),
          BaseArea.skeleton(),
        ],
        pesquisadores: [
          PesquisadorProjeto.skeleton(),
          PesquisadorProjeto.skeleton(),
        ],
        agenciasFomento: [
          AgenciaFomento.skeleton(),
          AgenciaFomento.skeleton(),
        ],
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
