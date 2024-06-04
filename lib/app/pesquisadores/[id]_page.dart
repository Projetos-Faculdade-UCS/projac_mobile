import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';

class PesquisadorPage extends StatelessWidget {
  const PesquisadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: Text('Pesquisador')),
      body: Center(
        child: Text('PesquisadorPage'),
      ),
    );
  }
}
