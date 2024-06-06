// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordenador.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordenador _$CoordenadorFromJson(Map<String, dynamic> json) => Coordenador(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
    );

Map<String, dynamic> _$CoordenadorToJson(Coordenador instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
    };
