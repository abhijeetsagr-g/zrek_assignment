import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zrek_assignment/logic/model/post.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});
  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
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

  String _formatTime(DateTime postTime) {
    final diff = DateTime.now().difference(postTime);
    if (diff.inSeconds < 60) return '${diff.inSeconds} seconds ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes} minutes ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          // Header
          Padding(
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
                      backgroundImage: CachedNetworkImageProvider(
                        post.userAvatarUrl,
                      ),
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
          ),

          // Image Carousal
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: post.imageUrls.length,
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: post.imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[200]),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (post.imageUrls.length > 1)
                Positioned(
                  top: 10,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${_currentIndex + 1}/${post.imageUrls.length}',
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

          // Dot Indicator
          if (post.imageUrls.length > 1)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(post.imageUrls.length, (i) {
                  final isActive = i == _currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: isActive ? 8 : 5,
                    height: isActive ? 6 : 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? const Color(0xFF0095F6)
                          : Colors.grey[400],
                    ),
                  );
                }),
              ),
            ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Row(
              children: [
                FaIcon(
                  post.isLiked
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  size: 26,
                  color: post.isLiked ? Colors.red : Colors.black,
                ),

                const SizedBox(width: 5),
                Text(
                  '${post.likeCount}',
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),

                const SizedBox(width: 16),

                // Comment
                FaIcon(FontAwesomeIcons.comment, size: 26),
                const SizedBox(width: 5),
                Text(
                  '${post.commentCount}',
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),

                const SizedBox(width: 16),

                // Repost
                FaIcon(FontAwesomeIcons.repeat, size: 20),

                const SizedBox(width: 16),

                // Share / Send
                FaIcon(FontAwesomeIcons.paperPlane, size: 20),
                const SizedBox(width: 5),
                Text(
                  '${post.shareCount}',
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),

                const Spacer(),

                FaIcon(
                  post.isSaved
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                  size: 22,
                ),
              ],
            ),
          ),

          // Captions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),

                children: [
                  TextSpan(
                    text: '${post.username} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(text: post.caption),
                  const TextSpan(
                    text: ' ... more',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              _formatTime(post.postTime),
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
