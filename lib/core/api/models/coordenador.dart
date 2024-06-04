import 'package:json_annotation/json_annotation.dart';

part 'coordenador.g.dart';

@JsonSerializable()
class Coordenador {
  Coordenador({
    required this.id,
    required this.nome,
    required this.sobrenome,
  });

  factory Coordenador.fromJson(Map<String, dynamic> json) =>
      _$CoordenadorFromJson(json);
  final int id;
  final String nome;
  final String sobrenome;

  Map<String, dynamic> toJson() => _$CoordenadorToJson(this);
}
