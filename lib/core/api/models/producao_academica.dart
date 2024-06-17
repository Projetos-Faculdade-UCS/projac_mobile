import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'producao_academica.g.dart';

@JsonSerializable()
class ProducaoAcademica extends Equatable {
  const ProducaoAcademica({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.descricao,
  });

  factory ProducaoAcademica.fromJson(Map<String, dynamic> json) =>
      _$ProducaoAcademicaFromJson(json);

  factory ProducaoAcademica.skeleton() => const ProducaoAcademica(
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

  @override
  List<Object?> get props => [id, titulo, tipo, descricao];

  @override
  bool get stringify => true;

  ProducaoAcademica copyWith({
    int? id,
    String? titulo,
    String? tipo,
    String? descricao,
  }) {
    return ProducaoAcademica(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      tipo: tipo ?? this.tipo,
      descricao: descricao ?? this.descricao,
    );
  }
}
