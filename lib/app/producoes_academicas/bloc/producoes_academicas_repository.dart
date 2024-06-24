import 'package:acadion/core/api/models/producao_academica.dart';
import 'package:acadion/core/get_it.dart';
import 'package:acadion/core/searchable_base_repository.dart';

class ProducoesAcademicasRepository
    implements SearchableBaseRepository<ProducaoAcademica> {
  Future<List<ProducaoAcademica>> fetch() async {
    return (await apiClient).getProducoesAcademicas();
  }

  Future<ProducaoAcademica> get(int id) async {
    return (await apiClient).getProducaoAcademica(id);
  }

  @override
  Future<List<ProducaoAcademica>> search(String query) async {
    return (await apiClient).getProducoesAcademicas(query: query);
  }
}
