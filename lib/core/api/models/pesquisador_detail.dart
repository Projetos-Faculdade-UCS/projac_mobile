import 'package:json_annotation/json_annotation.dart';

part 'pesquisador_detail.g.dart';

@JsonSerializable()
class PesquisadorDetail {
  PesquisadorDetail({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.dataNascimento,
    required this.fotoPerfil,
    required this.curriculoLattes,
  });

  factory PesquisadorDetail.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorDetailFromJson(json);

  factory PesquisadorDetail.skeleton() => PesquisadorDetail(
        id: 0,
        nome: 'Nome',
        sobrenome: 'Sobrenome',
        email: 'nome.sobrenome@gmail.com',
        dataNascimento: '01/01/2000',
        fotoPerfil: '',
        curriculoLattes: '',
      );

  final int id;
  final String nome;
  final String sobrenome;
  final String email;
  final String dataNascimento;
  final String fotoPerfil;
  final String curriculoLattes;

  Uri get curriculoLattesUri => Uri.parse(curriculoLattes);

  String get nomeCompleto => '$nome $sobrenome';

  Map<String, dynamic> toJson() => _$PesquisadorDetailToJson(this);
}
