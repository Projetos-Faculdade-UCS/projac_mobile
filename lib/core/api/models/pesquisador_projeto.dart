import 'package:json_annotation/json_annotation.dart';

part 'pesquisador_projeto.g.dart';

/// Esse é o PesquisadorProjetoProjeto do mockaroo.
@JsonSerializable()
class PesquisadorProjeto {
  PesquisadorProjeto({
    required this.nome,
    required this.sobrenome,
    required this.cargo,
    required this.horas,
    required this.fotoPerfil,
    required this.id,
  });

  factory PesquisadorProjeto.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorProjetoFromJson(json);
  final int id;
  final String nome;
  final String sobrenome;
  final String cargo;
  final int horas;
  final String fotoPerfil;

  Map<String, dynamic> toJson() => _$PesquisadorProjetoToJson(this);
}
