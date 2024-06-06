import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchActionButton<T> extends StatelessWidget {
  const SearchActionButton({
    required this.delegate,
    super.key,
  });

  final SearchDelegate<T> delegate;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Ionicons.search_outline,
      ),
      onPressed: () {
        showSearch(
          context: context,
          delegate: delegate,
        );
      },
    );
  }
}
