import 'package:json_annotation/json_annotation.dart';

part 'pesquisador.g.dart';

@JsonSerializable()
class Pesquisador {
  Pesquisador({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.genero,
    required this.telefone,
    required this.dataNascimento,
    required this.fotoPerfil,
    required this.curriculoLattes,
  });

  factory Pesquisador.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorFromJson(json);
  final int id;
  final String nome;
  final String sobrenome;
  final String email;
  final String genero;
  final String telefone;
  final String dataNascimento;
  final String fotoPerfil;
  final String curriculoLattes;

  Map<String, dynamic> toJson() => _$PesquisadorToJson(this);
}
