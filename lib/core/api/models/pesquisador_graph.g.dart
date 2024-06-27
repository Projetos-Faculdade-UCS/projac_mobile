// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador_graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PesquisadorGraph _$PesquisadorGraphFromJson(Map<String, dynamic> json) =>
    PesquisadorGraph(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      fotoPerfil: json['fotoPerfil'] as String,
      projetos: (json['projetos'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$PesquisadorGraphToJson(PesquisadorGraph instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'fotoPerfil': instance.fotoPerfil,
      'projetos': instance.projetos,
    };
