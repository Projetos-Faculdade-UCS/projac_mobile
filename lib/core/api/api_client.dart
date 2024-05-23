import 'package:dio/dio.dart';
import 'package:projac_mobile/core/api/models/area.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/core/api/models/usuario.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/projetos')
  Future<List<Projeto>> getProjetos({
    @Query('query') String? query,
  });

  @GET('/projetos/{id}')
  Future<Projeto> getProjeto(@Path('id') int id);

  @GET('/areas')
  Future<Area> getAreas();

  @GET('/pesquisadores')
  Future<List<Pesquisador>> getPesquisadores();

  @GET('/usuario')
  Future<Usuario> getUser();
}
