import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:json_annotation/json_annotation.dart';

enum StatusProjeto {
  emAndamento,
  concluido,
  cancelado,
}

extension StatusProjetoExtension on StatusProjeto {
  String get name {
    switch (this) {
      case StatusProjeto.emAndamento:
        return 'Em andamento';
      case StatusProjeto.concluido:
        return 'Concluído';
      case StatusProjeto.cancelado:
        return 'Cancelado';
    }
  }

  Color get color {
    switch (this) {
      case StatusProjeto.emAndamento:
        return Colors.orange;
      case StatusProjeto.concluido:
        return Colors.green;
      case StatusProjeto.cancelado:
        return Colors.red;
    }
  }

  IconData get iconData {
    switch (this) {
      case StatusProjeto.emAndamento:
        return Ionicons.construct;
      case StatusProjeto.concluido:
        return Ionicons.checkmark_done_sharp;
      case StatusProjeto.cancelado:
        return Ionicons.close;
    }
  }
}

class StatusProjetoConverter implements JsonConverter<StatusProjeto, String> {
  const StatusProjetoConverter();

  @override
  StatusProjeto fromJson(String json) {
    switch (json) {
      case 'EM_ANDAMENTO':
        return StatusProjeto.emAndamento;
      case 'CONCLUIDO':
        return StatusProjeto.concluido;
      case 'CANCELADO':
        return StatusProjeto.cancelado;
      default:
        throw ArgumentError.value(json);
    }
  }

  @override
  String toJson(StatusProjeto object) {
    switch (object) {
      case StatusProjeto.emAndamento:
        return 'EM_ANDAMENTO';
      case StatusProjeto.concluido:
        return 'CONCLUIDO';
      case StatusProjeto.cancelado:
        return 'CANCELADO';
    }
  }
}
