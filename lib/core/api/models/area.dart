import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class BaseArea {
  BaseArea({
    required this.nome,
    this.id,
  });

  factory BaseArea.fromJson(Map<String, dynamic> json) =>
      _$BaseAreaFromJson(json);

  final int? id;
  final String nome;

  Map<String, dynamic> toJson() => _$BaseAreaToJson(this);
}

@JsonSerializable()
class Area extends BaseArea {
  Area({
    required super.nome,
    required this.subareas,
    super.id,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  final List<BaseArea> subareas;

  @override
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
