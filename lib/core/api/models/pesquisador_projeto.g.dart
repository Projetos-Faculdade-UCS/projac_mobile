// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador_projeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PesquisadorProjeto _$PesquisadorProjetoFromJson(Map<String, dynamic> json) =>
    PesquisadorProjeto(
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      cargo: json['cargo'] as String,
      horas: (json['horas'] as num).toInt(),
      fotoPerfil: json['fotoPerfil'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$PesquisadorProjetoToJson(PesquisadorProjeto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'cargo': instance.cargo,
      'horas': instance.horas,
      'fotoPerfil': instance.fotoPerfil,
    };
