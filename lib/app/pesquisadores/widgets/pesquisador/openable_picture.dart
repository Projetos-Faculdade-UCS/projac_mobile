import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisador/dismissible_picture.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OpenablePicture extends StatelessWidget {
  const OpenablePicture({
    required this.imageUrl,
    super.key,
    this.size = 100,
  });

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransparentRoute<void>(
          DismissiblePicture(imageUrl: imageUrl),
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
        );
      },
      child: Hero(
        tag: imageUrl,
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
                    image: CachedNetworkImageProvider(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
        child: CachedNetworkImage(
          height: 100,
          width: 100,
          memCacheHeight: 100,
          memCacheWidth: 100,
          imageUrl: imageUrl,
          placeholder: (context, url) => Skeletonizer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[300]!.withOpacity(.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
          ),
        ),
      ),
    );
  }
}
