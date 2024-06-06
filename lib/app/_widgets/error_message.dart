import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({required this.error, super.key});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Erro ao carregar projetos: $error'),
    );
  }
}
