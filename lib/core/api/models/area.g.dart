// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseArea _$BaseAreaFromJson(Map<String, dynamic> json) => BaseArea(
      nome: json['nome'] as String,
      color: const _ColorConverter().fromJson(json['color'] as String),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseAreaToJson(BaseArea instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'color': const _ColorConverter().toJson(instance.color),
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      nome: json['nome'] as String,
      color: const _ColorConverter().fromJson(json['color'] as String),
      subareas: (json['subareas'] as List<dynamic>)
          .map((e) => BaseArea.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'color': const _ColorConverter().toJson(instance.color),
      'subareas': instance.subareas,
    };
