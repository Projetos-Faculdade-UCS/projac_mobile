import 'package:json_annotation/json_annotation.dart';

part 'pesquisador.g.dart';

@JsonSerializable()
class Pesquisador {
  Pesquisador({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.genero,
    required this.dataNascimento,
    required this.fotoPerfil,
    required this.curriculoLattes,
  });

  factory Pesquisador.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorFromJson(json);

  factory Pesquisador.skeleton() => Pesquisador(
        id: 0,
        nome: 'Nome',
        sobrenome: 'Sobrenome',
        email: 'nome.sobrenome@gmail.com',
        genero: 'Masculino',
        dataNascimento: '01/01/2000',
        fotoPerfil: '',
        curriculoLattes: '',
      );

  final int id;
  final String nome;
  final String sobrenome;
  final String email;
  final String genero;
  final String dataNascimento;
  final String fotoPerfil;
  final String curriculoLattes;

  Uri get curriculoLattesUri => Uri.parse(curriculoLattes);

  String get nomeCompleto => '$nome $sobrenome';

  Map<String, dynamic> toJson() => _$PesquisadorToJson(this);
}
