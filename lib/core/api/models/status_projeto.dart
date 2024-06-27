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

  Color get _colorFraca {
    switch (this) {
      case StatusProjeto.emAndamento:
        return Colors.orange.shade200;
      case StatusProjeto.concluido:
        return Colors.green.shade200;
      case StatusProjeto.cancelado:
        return Colors.red.shade200;
    }
  }

  Color get _colorForte {
    switch (this) {
      case StatusProjeto.emAndamento:
        return Colors.orange.shade800;
      case StatusProjeto.concluido:
        return Colors.green.shade800;
      case StatusProjeto.cancelado:
        return Colors.red.shade800;
    }
  }

  Color getColor(Brightness brightness) {
    return brightness == Brightness.light ? _colorFraca : _colorForte;
  }

  Color getIconColor(Brightness brightness) {
    return brightness == Brightness.light ? _colorForte : _colorFraca;
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
