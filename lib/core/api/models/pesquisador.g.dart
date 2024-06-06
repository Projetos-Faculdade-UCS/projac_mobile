// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisador.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pesquisador _$PesquisadorFromJson(Map<String, dynamic> json) => Pesquisador(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      email: json['email'] as String,
      genero: json['genero'] as String,
      dataNascimento: json['dataNascimento'] as String,
      fotoPerfil: json['fotoPerfil'] as String,
      curriculoLattes: json['curriculoLattes'] as String,
    );

Map<String, dynamic> _$PesquisadorToJson(Pesquisador instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'genero': instance.genero,
      'dataNascimento': instance.dataNascimento,
      'fotoPerfil': instance.fotoPerfil,
      'curriculoLattes': instance.curriculoLattes,
    };
