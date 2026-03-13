import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zrek_assignment/logic/model/post.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          // Avatar with story ring
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: post.userStory
                  ? const LinearGradient(
                      colors: [
                        Color(0xFFf09433),
                        Color(0xFFe6683c),
                        Color(0xFFdc2743),
                        Color(0xFFcc2366),
                        Color(0xFFbc1888),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: post.userStory ? null : Colors.transparent,
            ),
            child: Padding(
              padding: EdgeInsets.all(post.userStory ? 2 : 0),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(post.userAvatarUrl),
                backgroundColor: Colors.grey[200],
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Username + verified
          Expanded(
            child: Row(
              children: [
                Text(
                  post.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                if (post.isVerified) ...[
                  const SizedBox(width: 3),
                  const Icon(
                    Icons.verified,
                    size: 13,
                    color: Color(0xFF0095F6),
                  ),
                ],
              ],
            ),
          ),

          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_vert, size: 20),
          ),
        ],
      ),
    );
  }
}
