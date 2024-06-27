import 'package:json_annotation/json_annotation.dart';

part 'pesquisador_list.g.dart';

@JsonSerializable()
class PesquisadorList {
  PesquisadorList({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.fotoPerfil,
    required this.numeroProjetos,
    required this.numeroProducoes,
  });

  factory PesquisadorList.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorListFromJson(json);

  factory PesquisadorList.skeleton() => PesquisadorList(
        id: 0,
        nome: 'Nome',
        sobrenome: 'Sobrenome',
        fotoPerfil: '',
        numeroProjetos: 0,
        numeroProducoes: 0,
      );

  final int id;
  final String nome;
  final String sobrenome;
  final String fotoPerfil;
  final int numeroProjetos;
  final int numeroProducoes;

  String get nomeCompleto => '$nome $sobrenome';

  Map<String, dynamic> toJson() => _$PesquisadorListToJson(this);
}
