import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/error_message.dart';
import 'package:projac_mobile/app/_widgets/loading_indicator.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

class ProjetosSearchDelegate extends SearchDelegate<List<Projeto>> {
  ProjetosSearchDelegate(this._repository);
  final ProjetosRepository _repository;

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
    return FutureBuilder<List<Projeto>>(
      future: _repository.fetch(),
      builder: _builder,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Projeto>>(
      future: _repository.fetch(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<List<Projeto>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const LoadingIndicator();
    }
    if (snapshot.hasError) {
      return ErrorMessage(error: snapshot.error.toString());
    }
    final projetos = snapshot.data!;
    return ProjetosListView(projetos: projetos);
  }
}
