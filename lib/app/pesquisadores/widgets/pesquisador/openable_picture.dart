import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisador/dismissible_picture.dart';

class OpenablePicture extends StatelessWidget {
  const OpenablePicture({
    required this.image,
    super.key,
  });

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransparentRoute<void>(
          DismissiblePicture(image: image),
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
        );
      },
      child: Hero(
        tag: image,
        transitionOnUserGestures: true,
        createRectTween: (begin, end) {
          return MaterialRectCenterArcTween(begin: begin, end: end);
        },
        flightShuttleBuilder: (
          flightContext,
          animation,
          flightDirection,
          fromHeroContext,
          toHeroContext,
        ) {
          return ListenableBuilder(
            listenable: animation,
            builder: (context, snapshot) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    (1 - animation.value) * 50,
                  ),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
        child: CircleAvatar(
          radius: 50,
          backgroundImage: image,
        ),
      ),
    );
  }
}
