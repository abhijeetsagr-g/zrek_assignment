import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_scrollable/pinch_scrollable.dart';

class PostImage extends StatefulWidget {
  const PostImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<PostImage> createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  final GlobalKey _imageKey = GlobalKey();
  final ValueNotifier<bool> _isZooming = ValueNotifier(false);

  @override
  void dispose() {
    _isZooming.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isZooming,
      builder: (context, zooming, _) {
        return Stack(
          children: [
            if (zooming) Positioned.fill(child: Container(color: Colors.white)),
            PinchItemContainer(
              imageWidgetKey: _imageKey,
              imageUrl: widget.imageUrl,
              onZoomStart: () => _isZooming.value = true,
              onZoomEnd: () => _isZooming.value = false,
              child: Opacity(
                opacity: zooming ? 0.0 : 1.0,
                child: CachedNetworkImage(
                  key: _imageKey,
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
