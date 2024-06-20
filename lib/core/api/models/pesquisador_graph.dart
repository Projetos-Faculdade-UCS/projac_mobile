import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pesquisador_graph.g.dart';

@JsonSerializable()
class PesquisadorGraph extends Equatable {
  const PesquisadorGraph({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.fotoPerfil,
    required this.projetos,
  });

  factory PesquisadorGraph.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorGraphFromJson(json);

  factory PesquisadorGraph.skeleton() => const PesquisadorGraph(
        id: 0,
        nome: 'Nome',
        sobrenome: 'Sobrenome',
        fotoPerfil: '',
        projetos: [],
      );

  final int id;
  final String nome;
  final String sobrenome;
  final String fotoPerfil;
  final List<int> projetos;

  String get nomeCompleto => '$nome $sobrenome';

  Map<String, dynamic> toJson() => _$PesquisadorGraphToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
