import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/logic/model/post.dart';

class PostAction extends StatefulWidget {
  const PostAction({super.key, required this.post});

  final Post post;

  @override
  State<PostAction> createState() => _PostActionState();
}

class _PostActionState extends State<PostAction>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 100),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  void _onLike() {
    // Reset
    _controller.forward(from: 0.0);
    context.read<FeedBloc>().add(FeedLikeToggled(widget.post.postId));
  }

  void _onSave() {
    context.read<FeedBloc>().add(FeedSaveToggled(widget.post.postId));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
      child: Row(
        children: [
          // Like Button with Scale Animation
          GestureDetector(
            onTap: _onLike,
            behavior: HitTestBehavior.opaque,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FaIcon(
                post.isLiked
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                size: 26,
                color: post.isLiked ? Colors.red : Colors.black,
              ),
            ),
          ),

          const SizedBox(width: 8),
          Text(
            '${post.likeCount}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 16),

          // Comment Button
          const FaIcon(FontAwesomeIcons.comment, size: 24),
          const SizedBox(width: 6),
          Text(
            '${post.commentCount}',
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),

          const SizedBox(width: 16),

          // Repost Button
          const FaIcon(FontAwesomeIcons.repeat, size: 20),

          const SizedBox(width: 16),

          // Share Button
          const FaIcon(FontAwesomeIcons.paperPlane, size: 20),
          const SizedBox(width: 6),
          Text(
            '${post.shareCount}',
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),

          const Spacer(),

          // Save Button
          GestureDetector(
            onTap: _onSave,
            child: FaIcon(
              post.isSaved
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              size: 24,
              color: post.isSaved ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
