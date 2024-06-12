// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PesquisadorList _$PesquisadorListFromJson(Map<String, dynamic> json) =>
    PesquisadorList(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      fotoPerfil: json['fotoPerfil'] as String,
      numeroProjetos: (json['numeroProjetos'] as num).toInt(),
      numeroProducoes: (json['numeroProducoes'] as num).toInt(),
    );

Map<String, dynamic> _$PesquisadorListToJson(PesquisadorList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'fotoPerfil': instance.fotoPerfil,
      'numeroProjetos': instance.numeroProjetos,
      'numeroProducoes': instance.numeroProducoes,
    };
