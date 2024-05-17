import 'package:json_annotation/json_annotation.dart';

part 'valor_arrecadado.g.dart';

@JsonSerializable()
class ValorArrecadado {
  ValorArrecadado({
    required this.valor,
    required this.descricao,
  });

  factory ValorArrecadado.fromJson(Map<String, dynamic> json) =>
      _$ValorArrecadadoFromJson(json);
  final double valor;
  final String descricao;

  Map<String, dynamic> toJson() => _$ValorArrecadadoToJson(this);
}
