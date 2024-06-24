import 'package:acadion/core/api/models/area.dart';
import 'package:acadion/core/api/models/coordenador.dart';
import 'package:acadion/core/api/models/status_projeto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projeto_list.g.dart';

@JsonSerializable()
class ProjetoList extends Equatable {
  const ProjetoList({
    required this.id,
    required this.titulo,
    required this.objetivo,
    required this.dataCriacao,
    required this.status,
    required this.area,
    required this.coordenador,
    this.horas,
    this.cargo,
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
  final String? cargo;

  /// Horas de trabalho do projeto (somente ira aparecer
  /// na listagem de projetos de um pesquisador)
  final int? horas;

  Map<String, dynamic> toJson() => _$ProjetoListToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
