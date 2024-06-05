import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class DismissiblePicture extends StatefulWidget {
  const DismissiblePicture({
    required this.image,
    super.key,
  });

  final ImageProvider<Object> image;

  @override
  State<DismissiblePicture> createState() => _DismissiblePictureState();
}

class _DismissiblePictureState extends State<DismissiblePicture> {
  bool _zoomed = false;
  late final double _initialScale;
  final _scaleController = PhotoViewScaleStateController();
  final _controller = PhotoViewController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialScale =
          _controller.scale ?? PhotoViewComputedScale.contained.multiplier;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      disabled: _zoomed,
      direction: DismissiblePageDismissDirection.down,
      dragSensitivity: 0.5,
      onDismissed: () {
        Navigator.of(context).pop();
      },
      child: Center(
        child: Hero(
          tag: widget.image,
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
                      image: widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          },
          child: PhotoView(
            controller: _controller,
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            onScaleEnd: (context, details, controllerValue) {
              _setZoomed(controllerValue.scale);
            },
            scaleStateChangedCallback: (state) {
              Future.delayed(const Duration(milliseconds: 300), () {
                _setZoomed(_controller.scale);
              });
            },
            initialScale: PhotoViewComputedScale.contained,
            enablePanAlways: false,
            scaleStateController: _scaleController,
            imageProvider: widget.image,
            minScale: PhotoViewComputedScale.contained,
            tightMode: true,
          ),
        ),
      ),
    );
  }

  Future<void> _setZoomed(double? scale) async {
    if (scale == null || scale <= _initialScale * 1.02) {
      await Future.delayed(const Duration(milliseconds: 300), () {});
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      setState(() {
        _zoomed = false;
      });
    } else {
      await Future.delayed(const Duration(milliseconds: 300), () {});
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: <SystemUiOverlay>[],
      );
      setState(() {
        _zoomed = true;
      });
    }
  }
}
