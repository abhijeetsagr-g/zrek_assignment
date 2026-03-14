import 'package:flutter/material.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/ui/home/widget/post/post_action.dart';
import 'package:zrek_assignment/ui/home/widget/post/post_caption.dart';
import 'package:zrek_assignment/ui/home/widget/post/post_header.dart';
import 'package:zrek_assignment/ui/home/widget/post/post_media.dart';
import 'package:zrek_assignment/ui/home/widget/post/post_time.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),

          PostMedia(imageUrls: post.imageUrls),

          PostAction(post: post),

          PostCaption(username: post.username, caption: post.caption),

          PostTime(postTime: post.postTime),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
