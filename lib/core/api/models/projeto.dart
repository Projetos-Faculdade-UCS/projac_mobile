import 'package:json_annotation/json_annotation.dart';
import 'package:projac_mobile/core/api/models/agencia_fomento.dart';
import 'package:projac_mobile/core/api/models/area.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';
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
    this.descricao,
    this.dataConclusao,
  });

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
  final String area;
  final List<ProducaoAcademica> producoesAcademicas;
  final List<ValorArrecadado> valoresArrecadados;
  final List<BaseArea> subareas;
  final List<Pesquisador> pesquisadores;
  final List<AgenciaFomento> agenciasFomento;

  Map<String, dynamic> toJson() => _$ProjetoToJson(this);
}
