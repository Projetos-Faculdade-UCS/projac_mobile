import 'package:json_annotation/json_annotation.dart';

part 'pesquisador.g.dart';

/// Esse é o PesquisadorProjeto do mockaroo.
@JsonSerializable()
class Pesquisador {
  Pesquisador({
    required this.nome,
    required this.cargo,
    required this.horas,
    this.id,
  });

  factory Pesquisador.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorFromJson(json);
  final int? id;
  final String nome;
  final String cargo;
  final int horas;

  Map<String, dynamic> toJson() => _$PesquisadorToJson(this);
}
