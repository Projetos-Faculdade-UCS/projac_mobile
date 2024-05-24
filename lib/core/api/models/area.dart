import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class BaseArea {
  BaseArea({
    required this.nome,
    required this.color,
    this.id,
  });

  factory BaseArea.fromJson(Map<String, dynamic> json) =>
      _$BaseAreaFromJson(json);

  final int? id;
  final String nome;

  @_ColorConverter()
  final Color color;

  Map<String, dynamic> toJson() => _$BaseAreaToJson(this);
}

@JsonSerializable()
class Area extends BaseArea {
  Area({
    required super.nome,
    required super.color,
    required this.subareas,
    super.id,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  final List<BaseArea> subareas;

  @override
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

/// A color is a hex string. in the format #RRGGBB.
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
