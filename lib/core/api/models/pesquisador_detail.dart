import 'package:acadion/core/api/models/producao_academica.dart';
import 'package:acadion/core/api/models/projeto_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pesquisador_detail.g.dart';

@JsonSerializable()
class PesquisadorDetail extends Equatable {
  const PesquisadorDetail({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.dataNascimento,
    required this.fotoPerfil,
    required this.curriculoLattes,
    required this.projetos,
    required this.producoesAcademicas,
  });

  factory PesquisadorDetail.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorDetailFromJson(json);

  factory PesquisadorDetail.skeleton() => const PesquisadorDetail(
        id: 0,
        nome: 'Nome',
        sobrenome: 'Sobrenome',
        email: 'nome.sobrenome@gmail.com',
        dataNascimento: '01/01/2000',
        fotoPerfil: '',
        curriculoLattes: '',
        projetos: [],
        producoesAcademicas: [],
      );

  final int id;
  final String nome;
  final String sobrenome;
  final String email;
  final String dataNascimento;
  final String fotoPerfil;
  final String curriculoLattes;
  final List<ProjetoList> projetos;
  final List<ProducaoAcademica> producoesAcademicas;

  Uri get curriculoLattesUri => Uri.parse(curriculoLattes);

  String get nomeCompleto => '$nome $sobrenome';

  Map<String, dynamic> toJson() => _$PesquisadorDetailToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
