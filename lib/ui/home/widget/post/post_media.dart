import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_scrollable/pinch_scrollable.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zrek_assignment/ui/home/widget/post/dot_indicators.dart';

class PostMedia extends StatefulWidget {
  const PostMedia({super.key, required this.imageUrls});
  final List<String> imageUrls;

  @override
  State<PostMedia> createState() => _PostMediaState();
}

class _PostMediaState extends State<PostMedia> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.imageUrls;

    if (images.isEmpty) return const SizedBox.shrink();

    if (images.length == 1) {
      final imageKey = GlobalKey();
      return PinchItemContainer(
        imageWidgetKey: imageKey,
        imageUrl: images.first,
        child: CachedNetworkImage(
          key: imageKey,
          imageUrl: images.first,
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (_, __) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(color: Colors.white),
          ),
          errorWidget: (_, __, ___) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
          ),
        ),
      );
    }

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 300,
              child: Builder(
                builder: (builderContext) => PageView.builder(
                  controller: _pageController,
                  physics: PinchScrollLockPhysics.build(builderContext),
                  itemCount: images.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (_, index) {
                    final imageKey = GlobalKey();
                    return PinchItemContainer(
                      imageWidgetKey: imageKey,
                      imageUrl: images[index],
                      child: CachedNetworkImage(
                        key: imageKey,
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                        placeholder: (_, __) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(color: Colors.white),
                        ),
                        errorWidget: (_, _, ___) => Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.broken_image_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_currentIndex + 1}/${images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        DotIndicators(length: images.length, currentIndex: _currentIndex),
      ],
    );
  }
}
