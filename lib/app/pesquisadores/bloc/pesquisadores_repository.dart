import 'package:projac_mobile/core/api/api_client.dart';
import 'package:projac_mobile/core/api/models/pesquisador_detail.dart';
import 'package:projac_mobile/core/api/models/pesquisador_list.dart';

class PesquisadoresRepository {
  PesquisadoresRepository(this.apiClient);
  final ApiClient apiClient;

  Future<List<PesquisadorList>> getPesquisadores() async {
    return apiClient.getPesquisadores();
  }

  Future<PesquisadorDetail> getPesquisador(int id) async {
    return apiClient.getPesquisador(id);
  }
}
