// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjetoList _$ProjetoListFromJson(Map<String, dynamic> json) => ProjetoList(
      id: (json['id'] as num).toInt(),
      titulo: json['titulo'] as String,
      objetivo: json['objetivo'] as String,
      dataCriacao: json['dataCriacao'] as String,
      status: const StatusProjetoConverter().fromJson(json['status'] as String),
      area: BaseArea.fromJson(json['area'] as Map<String, dynamic>),
      coordenador:
          Coordenador.fromJson(json['coordenador'] as Map<String, dynamic>),
      horas: (json['horas'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProjetoListToJson(ProjetoList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'objetivo': instance.objetivo,
      'dataCriacao': instance.dataCriacao,
      'status': const StatusProjetoConverter().toJson(instance.status),
      'area': instance.area,
      'coordenador': instance.coordenador,
      'horas': instance.horas,
    };
