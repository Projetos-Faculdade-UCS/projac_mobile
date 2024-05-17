// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_academica.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProducaoAcademica _$ProducaoAcademicaFromJson(Map<String, dynamic> json) =>
    ProducaoAcademica(
      id: (json['id'] as num).toInt(),
      titulo: json['titulo'] as String,
      tipo: json['tipo'] as String,
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$ProducaoAcademicaToJson(ProducaoAcademica instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'tipo': instance.tipo,
      'descricao': instance.descricao,
    };
