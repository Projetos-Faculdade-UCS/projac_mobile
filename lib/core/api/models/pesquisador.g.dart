// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pesquisador _$PesquisadorFromJson(Map<String, dynamic> json) => Pesquisador(
      nome: json['nome'] as String,
      cargo: json['cargo'] as String,
      horas: (json['horas'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PesquisadorToJson(Pesquisador instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cargo': instance.cargo,
      'horas': instance.horas,
    };
