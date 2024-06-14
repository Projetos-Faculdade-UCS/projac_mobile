import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/error_message.dart';
import 'package:projac_mobile/app/projetos/repositories/projetos_repository.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/projeto_list_tile.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/core/api/models/projeto_list.dart';

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
    return FutureBuilder<List<ProjetoList>>(
      future: _repository.search(query),
      builder: _builder,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<ProjetoList>>(
      future: _repository.search(query),
      builder: _builder,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.5),
        ),
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        color: Colors.white,
        fontSize: 20,
      );

  Widget _builder(
    BuildContext context,
    AsyncSnapshot<List<ProjetoList>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return ProjetosListView.skeleton;
    }
    if (snapshot.hasError) {
      return ErrorMessage(error: snapshot.error.toString());
    }
    final projetos = snapshot.data!;
    return ProjetosListView(
      projetos: projetos,
      itemBuilder: (context, index) {
        final projeto = projetos[index];
        return ProjetoListTile(
          projeto: projeto,
          isLast: index == projetos.length - 1,
        );
      },
    );
  }
}
