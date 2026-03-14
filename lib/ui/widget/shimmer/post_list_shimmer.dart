import 'package:flutter/material.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/post_card_shimmer.dart';

class PostListShimmer extends StatelessWidget {
  const PostListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const PostCardShimmer(),
        childCount: 5,
      ),
    );
  }
}
