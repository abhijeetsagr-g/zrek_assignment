import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:zrek_assignment/core/const/app_icons.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/logic/model/post.dart';

class PostAction extends StatelessWidget {
  const PostAction({super.key, required this.post});
  final Post post;
  void _onLike(BuildContext context) {
    context.read<FeedBloc>().add(FeedLikeToggled(post.postId));
  }

  void _onSave(BuildContext context) {
    context.read<FeedBloc>().add(FeedSaveToggled(post.postId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state is! FeedLoaded) return const SizedBox.shrink();
        final Post currentPost = state.posts.firstWhere(
          (p) => p.postId == post.postId,
        );
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
          child: Row(
            children: [
              // Like
              LikeButton(
                isLiked: currentPost.isLiked,
                likeCount: currentPost.likeCount,
                onTap: (isLiked) async {
                  _onLike(context);
                  return !isLiked;
                },
                likeBuilder: (isLiked) => AppIcons.svg(
                  isLiked ? AppIcons.likeFilled : AppIcons.like,
                  size: 26,
                  color: isLiked ? Colors.red : Colors.black,
                ),
                countBuilder: (count, isLiked, text) => Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(width: 16),
              // Comment
              AppIcons.svg(AppIcons.comment, size: 24),
              const SizedBox(width: 6),
              Text(
                '${currentPost.commentCount}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 16),
              // Share
              AppIcons.svg(AppIcons.share, size: 22),
              const SizedBox(width: 6),
              Text(
                '${currentPost.shareCount}',
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
              // Save
              GestureDetector(
                onTap: () => _onSave(context),
                child: AppIcons.svg(AppIcons.save, size: 24),
              ),
            ],
          ),
        );
      },
    );
  }
}
