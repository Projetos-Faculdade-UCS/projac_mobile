import 'package:acadion/core/api/models/pesquisador_detail.dart';
import 'package:acadion/core/api/models/pesquisador_graph.dart';
import 'package:acadion/core/api/models/pesquisador_list.dart';
import 'package:acadion/core/get_it.dart';
import 'package:acadion/core/searchable_base_repository.dart';

class PesquisadoresRepository
    implements SearchableBaseRepository<PesquisadorList> {
  PesquisadoresRepository();

  Future<List<PesquisadorList>> getPesquisadores() async {
    return (await apiClient).getPesquisadores();
  }

  Future<PesquisadorDetail> getPesquisador(int id) async {
    return (await apiClient).getPesquisador(id);
  }

  @override
  Future<List<PesquisadorList>> search(String query) async {
    return (await apiClient).getPesquisadores(query: query);
  }

  Future<List<PesquisadorGraph>> getGraph() async {
    return (await apiClient).getGraph();
  }
}
