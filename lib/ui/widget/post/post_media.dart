import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/ui/widget/post/post_image.dart';

class PostMedia extends StatefulWidget {
  const PostMedia({super.key, required this.post});
  final Post post;
  @override
  State<PostMedia> createState() => _PostMediaState();
}

class _PostMediaState extends State<PostMedia> {
  int _currentIndex = 0;
  bool _showHeart = false;
  void _onDoubleTap(BuildContext context) {
    if (!widget.post.isLiked) {
      context.read<FeedBloc>().add(FeedLikeToggled(widget.post.postId));
    }
    setState(() => _showHeart = true);
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showHeart = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.post.imageUrls;
    final isCarousel = images.length > 1;
    return Column(
      children: [
        GestureDetector(
          onDoubleTap: () => _onDoubleTap(context),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PageView.builder(
                  itemCount: images.length,
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (context, index) =>
                      PostImage(imageUrl: images[index]),
                ),
              ),
              if (isCarousel)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(60),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${_currentIndex + 1}/${images.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),

              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: _showHeart ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: const Center(
                    child: Icon(Icons.favorite, color: Colors.white, size: 80),
                  ),
                ),
              ),
            ],
          ),
        ),
        // dot indicator
        if (isCarousel) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentIndex == i ? 8 : 5,
                height: _currentIndex == i ? 8 : 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == i
                      ? const Color(0xFF0095F6)
                      : Colors.grey[400],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
