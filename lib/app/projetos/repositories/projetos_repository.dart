import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/core/get_it.dart';

class ProjetosRepository {
  Future<List<Projeto>> fetch() async {
    return (await apiClient).getProjetos();
  }

  Future<List<Projeto>> search(String query) async {
    return (await apiClient).getProjetos(query: query);
  }

  Future<Projeto> get(int id) async {
    return (await apiClient).getProjeto(id);
  }
}
