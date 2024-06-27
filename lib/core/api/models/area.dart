import 'dart:math';

import 'package:acadion/core/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class BaseArea {
  BaseArea({
    required this.nome,
    required this.cor,
    this.id,
  });

  factory BaseArea.skeleton() {
    final random = Random();
    return BaseArea(
      nome: _examples[random.nextInt(_examples.length)],
      cor: MainTheme.lightTheme.primaryColor,
    );
  }

  factory BaseArea.fromJson(Map<String, dynamic> json) =>
      _$BaseAreaFromJson(json);

  static const _examples = [
    'Exatas',
    'Ciências Biológicas',
    'Outra',
  ];

  final int? id;
  final String nome;

  @_ColorConverter()
  final Color cor;

  Map<String, dynamic> toJson() => _$BaseAreaToJson(this);
}

@JsonSerializable()
class Area extends BaseArea {
  Area({
    required super.nome,
    required super.cor,
    required this.subareas,
    super.id,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  final List<BaseArea> subareas;

  @override
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

/// A cor is a hex string. in the format #RRGGBB.
class _ColorConverter implements JsonConverter<Color, String> {
  const _ColorConverter();

  @override
  Color fromJson(String json) {
    return Color(int.parse(json.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  String toJson(Color object) {
    return '#${object.value.toRadixString(16).substring(2)}';
  }
}
