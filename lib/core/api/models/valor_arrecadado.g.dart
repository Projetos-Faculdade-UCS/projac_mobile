// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_arrecadado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorArrecadado _$ValorArrecadadoFromJson(Map<String, dynamic> json) =>
    ValorArrecadado(
      valor: (json['valor'] as num).toDouble(),
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$ValorArrecadadoToJson(ValorArrecadado instance) =>
    <String, dynamic>{
      'valor': instance.valor,
      'descricao': instance.descricao,
    };
