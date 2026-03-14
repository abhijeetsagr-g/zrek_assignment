import 'package:flutter/material.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/ui/widget/post/post_action.dart';
import 'package:zrek_assignment/ui/widget/post/post_caption.dart';
import 'package:zrek_assignment/ui/widget/post/post_header.dart';
import 'package:zrek_assignment/ui/widget/post/post_media.dart';
import 'package:zrek_assignment/ui/widget/post/post_time.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostHeader(post: post),
        PostMedia(post: post),
        PostAction(post: post),
        PostCaption(username: post.username, caption: post.caption),
        const SizedBox(height: 4),
        PostTime(postTime: post.postTime),
        const SizedBox(height: 12),
      ],
    );
  }
}
