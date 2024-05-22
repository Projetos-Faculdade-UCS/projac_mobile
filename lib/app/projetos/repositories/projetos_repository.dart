import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/core/get_it.dart';

class ProjetosRepository {
  Future<List<Projeto>> fetch() async {
    return apiClient.getProjetos();
  }
}
