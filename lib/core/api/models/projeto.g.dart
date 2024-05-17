// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projeto _$ProjetoFromJson(Map<String, dynamic> json) => Projeto(
      id: (json['id'] as num).toInt(),
      titulo: json['titulo'] as String,
      objetivo: json['objetivo'] as String,
      dataCriacao: json['dataCriacao'] as String,
      valorSolicitado: (json['valorSolicitado'] as num).toDouble(),
      valorTotalArrecadado: (json['valorTotalArrecadado'] as num).toDouble(),
      area: json['area'] as String,
      producoesAcademicas: (json['producoesAcademicas'] as List<dynamic>)
          .map((e) => ProducaoAcademica.fromJson(e as Map<String, dynamic>))
          .toList(),
      valoresArrecadados: (json['valoresArrecadados'] as List<dynamic>)
          .map((e) => ValorArrecadado.fromJson(e as Map<String, dynamic>))
          .toList(),
      subareas: (json['subareas'] as List<dynamic>)
          .map((e) => BaseArea.fromJson(e as Map<String, dynamic>))
          .toList(),
      pesquisadores: (json['pesquisadores'] as List<dynamic>)
          .map((e) => Pesquisador.fromJson(e as Map<String, dynamic>))
          .toList(),
      agenciasFomento: (json['agenciasFomento'] as List<dynamic>)
          .map((e) => AgenciaFomento.fromJson(e as Map<String, dynamic>))
          .toList(),
      descricao: json['descricao'] as String?,
      dataConclusao: json['dataConclusao'] as String?,
    );

Map<String, dynamic> _$ProjetoToJson(Projeto instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'objetivo': instance.objetivo,
      'dataCriacao': instance.dataCriacao,
      'valorSolicitado': instance.valorSolicitado,
      'descricao': instance.descricao,
      'dataConclusao': instance.dataConclusao,
      'valorTotalArrecadado': instance.valorTotalArrecadado,
      'area': instance.area,
      'producoesAcademicas': instance.producoesAcademicas,
      'valoresArrecadados': instance.valoresArrecadados,
      'subareas': instance.subareas,
      'pesquisadores': instance.pesquisadores,
      'agenciasFomento': instance.agenciasFomento,
    };
