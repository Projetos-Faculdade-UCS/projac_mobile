import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:routefly/routefly.dart';

class ProjetoPage extends StatelessWidget {
  const ProjetoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Routefly.query['id'];
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Projeto $id'),
      ),
      body: Center(
        child: Text('Projeto $id'),
      ),
    );
  }
}
