import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/ui/widget/post/post_card.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/post_card_shimmer.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;
  final bool isFetchingMore;
  const PostList({
    super.key,
    required this.posts,
    required this.isFetchingMore,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == posts.length) return const PostCardShimmer();
        if (index == posts.length - 2) {
          context.read<FeedBloc>().add(FeedLoadMore());
        }
        return PostCard(post: posts[index]);
      }, childCount: isFetchingMore ? posts.length + 1 : posts.length),
    );
  }
}
