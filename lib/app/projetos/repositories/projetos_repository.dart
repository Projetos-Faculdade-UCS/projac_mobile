import 'package:acadion/core/api/models/projeto.dart';
import 'package:acadion/core/api/models/projeto_list.dart';
import 'package:acadion/core/get_it.dart';
import 'package:acadion/core/searchable_base_repository.dart';

class ProjetosRepository implements SearchableBaseRepository<ProjetoList> {
  Future<List<ProjetoList>> fetch() async {
    return (await apiClient).getProjetos();
  }

  @override
  Future<List<ProjetoList>> search(String query) async {
    return (await apiClient).getProjetos(query: query);
  }

  Future<Projeto> get(int id) async {
    return (await apiClient).getProjeto(id);
  }
}
