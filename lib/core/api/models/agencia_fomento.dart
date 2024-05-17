import 'package:json_annotation/json_annotation.dart';

part 'agencia_fomento.g.dart';

@JsonSerializable()
class AgenciaFomento {
  AgenciaFomento({
    required this.nome,
    required this.sigla,
    this.id,
  });

  factory AgenciaFomento.fromJson(Map<String, dynamic> json) =>
      _$AgenciaFomentoFromJson(json);

  final int? id;
  final String nome;
  final String sigla;

  Map<String, dynamic> toJson() => _$AgenciaFomentoToJson(this);
}
