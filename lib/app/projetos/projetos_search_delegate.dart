import 'package:flutter/material.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

class ProjetosSearchDelegate extends SearchDelegate<List<Projeto>> {
  ProjetosSearchDelegate(this.repository);
  final ProjetosRepository repository;

  @override
  String? get searchFieldLabel => 'Pesquisar projetos';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        close(context, []);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
