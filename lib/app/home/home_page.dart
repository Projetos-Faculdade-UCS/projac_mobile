import 'package:flutter/material.dart';
import 'package:projac_mobile/app/home/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const String title = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: const HomeDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'My HomePage',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Do Nothing',
        child: const Icon(Icons.abc_rounded),
      ),
    );
  }
}
