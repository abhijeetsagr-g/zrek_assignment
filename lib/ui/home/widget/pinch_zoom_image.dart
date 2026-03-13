import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zrek_assignment/core/utlis/zoom_notification.dart';

class PinchZoomImage extends StatefulWidget {
  const PinchZoomImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<PinchZoomImage> createState() => _PinchZoomImageState();
}

class _PinchZoomImageState extends State<PinchZoomImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TransformationController _transformationController;
  Animation<Matrix4>? animation;
  OverlayEntry? entry;

  final double minScale = 1;
  final double maxScale = 4;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            if (animation != null) {
              _transformationController.value = animation!.value;
            }
          })
          ..addStatusListener((status) {
            if (status == .completed) {
              removeOverlay();
            }
          });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(from: 0);
  }

  Widget _buildImage() => InteractiveViewer(
    transformationController: _transformationController,
    clipBehavior: .none,
    panEnabled: false,
    minScale: minScale,
    maxScale: maxScale,
    onInteractionStart: (details) {
      if (details.pointerCount < 2) return;
      ZoomNotification(true).dispatch(context);
      context
          .findAncestorStateOfType<ScrollableState>()
          ?.position
          .context
          .setIgnorePointer(true);

      showOverlay(context);
    },
    onInteractionEnd: (details) {
      ZoomNotification(false).dispatch(context);
      final isZoomed = _transformationController.value != Matrix4.identity();
      if (isZoomed) {
        resetAnimation();
      } else {
        removeOverlay(); // no animation needed, just remove
      }
    },

    child: CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      placeholder: (context, url) => Container(color: Colors.grey[200]),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
      ),
    ),
  );

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy,
        width: size.width,
        height: size.height,
        child: AnimatedBuilder(
          animation: _transformationController,
          builder: (context, child) => Transform(
            transform: _transformationController.value,
            child: child,
          ),
          child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    Overlay.of(context).insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
    _controller.reset();
  }
}
