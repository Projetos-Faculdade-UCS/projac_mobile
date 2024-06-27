import 'package:acadion/app/_widgets/search/generic_search_delegate.dart';
import 'package:acadion/core/searchable_base_repository.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchActionButton<T> extends StatelessWidget {
  const SearchActionButton({
    required this.repository,
    required this.resultBuilder,
    required this.searchFieldLabel,
    super.key,
  });

  final SearchableBaseRepository<T> repository;
  final Widget Function(BuildContext, AsyncSnapshot<List<T>>) resultBuilder;
  final String searchFieldLabel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Ionicons.search_outline,
      ),
      onPressed: () {
        showSearch(
          context: context,
          delegate: GenericSearchDelegate(
            repository: repository,
            builder: resultBuilder,
            searchFieldLabel: searchFieldLabel,
          ),
        );
      },
    );
  }
}
