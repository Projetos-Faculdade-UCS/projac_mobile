import 'package:json_annotation/json_annotation.dart';
import 'package:projac_mobile/core/api/models/area.dart';
import 'package:projac_mobile/core/api/models/coordenador.dart';
import 'package:projac_mobile/core/api/models/status_projeto.dart';

part 'projeto_list.g.dart';

@JsonSerializable()
class ProjetoList {
  ProjetoList({
    required this.id,
    required this.titulo,
    required this.objetivo,
    required this.dataCriacao,
    required this.status,
    required this.area,
    required this.coordenador,
  });

  factory ProjetoList.fromJson(Map<String, dynamic> json) =>
      _$ProjetoListFromJson(json);

  factory ProjetoList.skeleton() => ProjetoList(
        id: 0,
        titulo: 'Título Projeto',
        objetivo: 'Objetivo' * 20,
        dataCriacao: 'Data de criação',
        status: StatusProjeto.emAndamento,
        area: BaseArea.skeleton(),
        coordenador: Coordenador.skeleton(),
      );

  final int id;
  final String titulo;
  final String objetivo;
  final String dataCriacao;
  @StatusProjetoConverter()
  final StatusProjeto status;
  final BaseArea area;
  final Coordenador coordenador;

  Map<String, dynamic> toJson() => _$ProjetoListToJson(this);
}
