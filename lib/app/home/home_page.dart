import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/home/widgets/home_drawer.dart';
import 'package:projac_mobile/core/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const String title = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(title),
      ),
      drawer: const HomeDrawer(),
      // TODO(marhaubrich): Remove this code and make the API call in it's respective page and bloc.
      body: Center(
        child: StatefulBuilder(
          builder: (context, setState) {
            return StreamBuilder(
              stream: apiClient.getProjetos().asStream(),
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Get Projetos'),
                    ),
                    if (snapshot.hasData)
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].titulo),
                              subtitle: Text(
                                snapshot.data![index].objetivo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            );
          },
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
