import 'package:acadion/core/searchable_base_repository.dart';
import 'package:flutter/material.dart';

class GenericSearchDelegate<T> extends SearchDelegate<List<T>> {
  GenericSearchDelegate({
    required this.repository,
    required this.builder,
    required String searchFieldLabel,
  }) : _searchFieldLabel = searchFieldLabel,
       super();

  final SearchableBaseRepository<T> repository;

  final Widget Function(BuildContext, AsyncSnapshot<List<T>>) builder;

  final String _searchFieldLabel;

  @override
  String get searchFieldLabel => _searchFieldLabel;

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
    return FutureBuilder<List<T>>(
      future: repository.search(query),
      builder: builder,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: repository.search(query),
      builder: builder,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: .5),
        ),
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
}
