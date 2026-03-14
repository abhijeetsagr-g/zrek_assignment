import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/action_shimmer.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/caption_shimmer.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/header_shimmer.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/media_shimmer.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/time_shimmer.dart';

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Colors.grey[300]!;
    final highlight = Colors.grey[100]!;

    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderShimmer(),
            MediaShimmer(),
            ActionShimmer(),
            CaptionShimmer(),
            TimeShimmer(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
