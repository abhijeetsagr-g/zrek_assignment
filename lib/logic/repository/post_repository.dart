import 'dart:math';
import 'package:zrek_assignment/logic/model/post.dart';

class PostRepository {
  static const int _limit = 5;

  final List<String> _usernames = [
    "alex",
    "maria",
    "leo",
    "sophia",
    "nathan",
    "olivia",
    "liam",
    "ava",
  ];

  final List<String> _captions = [
    "Golden hour hits different ✨",
    "Weekend vibes 🌴",
    "Just another beautiful moment.",
    "Exploring new places.",
    "Life lately.",
    "Caught this before sunset.",
    "Memories in the making.",
    "A small glimpse of today.",
  ];

  final Random _random = Random();

  Future<List<Post>> fetchPosts(int page) async {
    if (page < 0) return [];

    await Future.delayed(const Duration(milliseconds: 1200));

    return List.generate(_limit, (index) {
      final postIndex = page * _limit + index;
      final username = _usernames[_random.nextInt(_usernames.length)];
      final imageCount = _random.nextBool() ? 1 : _random.nextInt(3) + 1;
      final images = List.generate(
        imageCount,
        (i) => "https://picsum.photos/600/600?random=${postIndex * 3 + i}",
      );

      return Post(
        postId: "post_$postIndex",
        userId: "user_$username",
        username: username,
        userStory: _random.nextBool(),
        userAvatarUrl:
            "https://api.dicebear.com/7.x/adventurer/png?seed=$username",
        isVerified: _random.nextInt(10) > 7,

        imageUrls: images,

        caption: _captions[_random.nextInt(_captions.length)],

        postTime: DateTime.now().subtract(
          Duration(minutes: _random.nextInt(600)),
        ),

        shareCount: _random.nextInt(200),
        likeCount: _random.nextInt(500),
        commentCount: _random.nextInt(80),

        isLiked: false,
        isSaved: false,
      );
    });
  }
}
