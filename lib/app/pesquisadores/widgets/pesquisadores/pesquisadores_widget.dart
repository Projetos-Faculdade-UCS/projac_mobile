import 'package:acadion/app/pesquisadores/widgets/pesquisadores/pesquisadores_list_view.dart';
import 'package:acadion/core/api/models/pesquisador_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PesquisadoresWidget extends StatelessWidget {
  const PesquisadoresWidget({
    required this.pesquisadores,
    super.key,
  });

  final List<PesquisadorList> pesquisadores;

  static Widget? _skeleton;

  static Widget get skeleton {
    final pesquisadores = List.generate(
      10,
      (index) => PesquisadorList.skeleton(),
    );

    return _skeleton ??= Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!.withOpacity(.3),
        highlightColor: Colors.grey[100]!.withOpacity(.5),
      ),
      child: PesquisadoresWidget(
        key: const Key('pesquisadores_widget_skeleton'),
        pesquisadores: pesquisadores,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PesquisadoresListView(
      pesquisadores: pesquisadores,
    );
  }
}
