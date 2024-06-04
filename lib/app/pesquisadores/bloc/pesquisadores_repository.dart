import 'package:projac_mobile/core/api/api_client.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';

class PesquisadoresRepository {
  PesquisadoresRepository(this.apiClient);
  final ApiClient apiClient;

  Future<List<Pesquisador>> getPesquisadores() async {
    return apiClient.getPesquisadores();
  }

  Future<Pesquisador> getPesquisador(int id) async {
    return apiClient.getPesquisador(id);
  }
}
