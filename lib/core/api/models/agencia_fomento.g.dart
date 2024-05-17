// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agencia_fomento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgenciaFomento _$AgenciaFomentoFromJson(Map<String, dynamic> json) =>
    AgenciaFomento(
      nome: json['nome'] as String,
      sigla: json['sigla'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AgenciaFomentoToJson(AgenciaFomento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sigla': instance.sigla,
    };
