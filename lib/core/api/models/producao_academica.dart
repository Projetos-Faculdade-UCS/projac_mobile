import 'package:json_annotation/json_annotation.dart';

part 'producao_academica.g.dart';

@JsonSerializable()
class ProducaoAcademica {
  ProducaoAcademica({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.descricao,
  });

  factory ProducaoAcademica.fromJson(Map<String, dynamic> json) =>
      _$ProducaoAcademicaFromJson(json);

  factory ProducaoAcademica.skeleton() => ProducaoAcademica(
        id: 0,
        titulo: 'Título Qualquer',
        tipo: 'Tipo Qualquer',
        descricao: 'Descrição Qualquer',
      );

  final int id;
  final String titulo;
  final String tipo;
  final String descricao;

  Map<String, dynamic> toJson() => _$ProducaoAcademicaToJson(this);
}
