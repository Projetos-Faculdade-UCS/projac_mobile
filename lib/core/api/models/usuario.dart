import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  Usuario({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.genero,
    required this.telefone,
    required this.dataNascimento,
    required this.fotoPerfil,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  final int id;
  final String nome;
  final String sobrenome;
  final String email;
  final String genero;
  final String telefone;
  final String dataNascimento;
  final Uri? fotoPerfil;

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
