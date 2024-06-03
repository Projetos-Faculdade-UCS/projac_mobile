import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

extension ProjetoStatusExtension on StatusProjeto {
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
