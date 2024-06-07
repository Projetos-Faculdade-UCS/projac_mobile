import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisador/pesquisador_bloc.dart';
import 'package:projac_mobile/app/pesquisadores/get_it.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisador/cubit/pesquisador_app_bar_cubit.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisador/pesquisador_widget.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto/tabs/producoes_academicas_tab.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';
import 'package:routefly/routefly.dart';

class PesquisadorPage extends StatefulWidget {
  const PesquisadorPage({super.key});

  @override
  State<PesquisadorPage> createState() => _PesquisadorPageState();
}

class _PesquisadorPageState extends State<PesquisadorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final bool disposeGetIt;
  final pesquisadorAppBarCubit = PesquisadorAppBarCubit();
  late final Future<PesquisadorBloc> bloc;

  @override
  void initState() {
    super.initState();
    disposeGetIt = setupPesquisadorGetIt();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    bloc = pesquisadorGetIt.getAsync<PesquisadorBloc>();
  }

  @override
  void dispose() {
    disposePesquisadorGetIt(
      dispose: disposeGetIt,
    );
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleTabSelection() async {
    if (_tabController.index == 0) {
      pesquisadorAppBarCubit.hidePesquisador();
    } else {
      final state = (await bloc).state;
      if (state is PesquisadorLoaded) {
        final pesquisadorName = state.pesquisador.nomeCompleto;
        pesquisadorAppBarCubit.showPesquisador(pesquisadorName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = Routefly.query['id'] as int;
    return FutureBuilder<PesquisadorBloc>(
      future: bloc,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return BlocProvider<PesquisadorBloc>(
          create: (context) => snapshot.data!..add(PesquisadorLoad(id)),
          child: BlocProvider(
            create: (context) => pesquisadorAppBarCubit,
            child: Scaffold(
              appBar: CustomAppBar(
                title:
                    BlocBuilder<PesquisadorAppBarCubit, PesquisadorAppBarState>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) {
                        final opacityAnimation = Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: const Interval(
                              0.5,
                              1,
                            ),
                          ),
                        );

                        return FadeTransition(
                          opacity: opacityAnimation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: _buildTitle(
                        state,
                      ),
                    );
                  },
                ),
                bottom: TabBar(
                  controller: _tabController,
                  tabAlignment: TabAlignment.fill,
                  tabs: const [
                    Tab(
                      text: 'Perfil',
                      icon: Icon(Ionicons.person_outline),
                    ),
                    Tab(
                      text: 'Projetos',
                      icon: Icon(Ionicons.folder_open_outline),
                    ),
                    Tab(
                      text: 'Produções',
                      icon: Icon(Ionicons.library_outline),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  _buildPerfilTab(),
                  _buildProjetosTab(),
                  _buildProducoesTab(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPerfilTab() {
    return BlocBuilder<PesquisadorBloc, PesquisadorState>(
      builder: (context, state) {
        if (state is PesquisadorLoaded) {
          return PesquisadorWidget(
            pesquisador: state.pesquisador,
          );
        }

        if (state is PesquisadorError) {
          return const Center(
            child: Text('Erro ao carregar pesquisador'),
          );
        }

        return PesquisadorWidget.skeleton;
      },
    );
  }

  Widget _buildProjetosTab() {
    return BlocBuilder<PesquisadorBloc, PesquisadorState>(
      builder: (context, state) {
        if (state is PesquisadorLoaded) {
          return ProjetosListView(projetos: state.pesquisador.projetos);
        }

        if (state is PesquisadorError) {
          return const Center(
            child: Text('Erro ao carregar pesquisador'),
          );
        }

        return ProjetosListView.skeleton;
      },
    );
  }

  Widget _buildProducoesTab() {
    return BlocBuilder<PesquisadorBloc, PesquisadorState>(
      builder: (context, state) {
        if (state is PesquisadorLoaded) {
          return ProducoesAcademicasTab(
            producoesAcademicas: state.pesquisador.producoesAcademicas,
          );
        }

        if (state is PesquisadorError) {
          return const Center(
            child: Text('Erro ao carregar pesquisador'),
          );
        }

        return ProducoesAcademicasTab.skeleton;
      },
    );
  }

  Widget _buildTitle(PesquisadorAppBarState state) {
    if (state is PesquisadorAppBarShow) {
      if (_tabController.index != 0) {
        return Hero(
          tag: 'pesquisador_nome_completo_${state.title}_detail',
          child: Text(
            state.title,
            key: ValueKey<String>(
              state.title,
            ),
          ),
        );
      } else {
        return const Text(
          'Pesquisador',
          key: ValueKey<String>(
            'Pesquisador',
          ),
        );
      }
    }
    return const Text(
      'Pesquisador',
      key: ValueKey<String>(
        'Pesquisador',
      ),
    );
  }
}
