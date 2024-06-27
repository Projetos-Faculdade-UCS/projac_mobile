// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PesquisadorDetail _$PesquisadorDetailFromJson(Map<String, dynamic> json) =>
    PesquisadorDetail(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      email: json['email'] as String,
      dataNascimento: json['dataNascimento'] as String,
      fotoPerfil: json['fotoPerfil'] as String,
      curriculoLattes: json['curriculoLattes'] as String,
      projetos: (json['projetos'] as List<dynamic>)
          .map((e) => ProjetoList.fromJson(e as Map<String, dynamic>))
          .toList(),
      producoesAcademicas: (json['producoesAcademicas'] as List<dynamic>)
          .map((e) => ProducaoAcademica.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PesquisadorDetailToJson(PesquisadorDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'dataNascimento': instance.dataNascimento,
      'fotoPerfil': instance.fotoPerfil,
      'curriculoLattes': instance.curriculoLattes,
      'projetos': instance.projetos,
      'producoesAcademicas': instance.producoesAcademicas,
    };
