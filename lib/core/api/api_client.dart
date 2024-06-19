import 'package:dio/dio.dart';
import 'package:projac_mobile/core/api/models/area.dart';
import 'package:projac_mobile/core/api/models/pesquisador_detail.dart';
import 'package:projac_mobile/core/api/models/pesquisador_list.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/core/api/models/projeto_list.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/projetos')
  Future<List<ProjetoList>> getProjetos({
    @Query('q') String? query,
  });

  @GET('/projetos/{id}')
  Future<Projeto> getProjeto(@Path('id') int id);

  @GET('/areas')
  Future<Area> getAreas();

  @GET('/pesquisadores')
  Future<List<PesquisadorList>> getPesquisadores({
    @Query('q') String? query,
  });

  @GET('/pesquisadores/{id}')
  Future<PesquisadorDetail> getPesquisador(@Path('id') int id);

  @GET('/producoes-academicas')
  Future<List<ProducaoAcademica>> getProducoesAcademicas({
    @Query('q') String? query,
  });

  @GET('/producoes-academicas/{id}')
  Future<ProducaoAcademica> getProducaoAcademica(@Path('id') int id);

  @GET('/graph')
  Future<List<PesquisadorDetail>> getGraph();
}
