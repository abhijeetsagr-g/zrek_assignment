import 'dart:math';
import 'package:zrek_assignment/logic/model/post.dart';

class PostRepository {
  static const int _limit = 10;
  final Random _random = Random();

  final List<String> _usernames = [
    "alex",
    "maria",
    "leo",
    "sophia",
    "nathan",
    "olivia",
    "liam",
    "ava",
    "the.real.leo",
    "nathan_writes",
    "ava.jpg",
    "sophia_22",
    "liam.dev",
    "olivia.codes",
    "wander.with.mia",
    "dailywithalex",
    "noah_01",
    "ella.travels",
    "jayden.jpg",
    "luna.diary",
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
    "Coffee first ☕️ then everything else.",
    "That quiet moment before the world wakes up.",
    "Somewhere between dreams and reality.",
    "This view though 😮‍💨",
    "Small steps today. Big dreams tomorrow.",
    "Mood today: 🌊☀️📷",
    "Late night thoughts and city lights.",
    "New post, who dis? 😌",
    "Good food, good mood 🍜",
    "Travel more. Worry less.",
    "A day worth remembering.\nSometimes the little things matter most.",
    "Sunset chasers unite 🌅\n#goldenhour #nofilter",
  ];

  /// Special fixed accounts
  final Map<String, Map<String, dynamic>> _specialAccounts = {
    "pixel.journal": {
      "verified": true,
      "avatar": "https://api.dicebear.com/7.x/adventurer/png?seed=pixeljournal",
      "caption": "Chasing light through the lens 📷\n#photography #street",
    },
    "daily.bites": {
      "verified": true,
      "avatar": "https://api.dicebear.com/7.x/adventurer/png?seed=dailybites",
      "caption": "Food that speaks louder than words 🍜",
    },
    "roam.the.earth": {
      "verified": true,
      "avatar": "https://api.dicebear.com/7.x/adventurer/png?seed=roamtheearth",
      "caption": "Lost somewhere beautiful 🌍✈️",
    },
  };

  List<Post> getStoryUsers(List<Post> posts) {
    return posts.where((p) => p.hasStory).toList();
  }

  Future<List<Post>> fetchPosts(int page) async {
    if (page < 0) return [];

    await Future.delayed(const Duration(milliseconds: 1500));

    return List.generate(_limit, (index) {
      final postIndex = page * _limit + index;

      final allUsers = [..._usernames, ..._specialAccounts.keys];
      final username = allUsers[_random.nextInt(allUsers.length)];

      final special = _specialAccounts[username];

      /// 25% chance carousel
      final bool isCarousel = _random.nextInt(4) == 0;
      final bool portrait = isCarousel;
      final int imageCount = isCarousel ? _random.nextInt(3) + 2 : 1;

      final images = List.generate(
        imageCount,
        (i) => portrait
            ? "https://picsum.photos/600/750?random=${page * _limit * 5 + index * 5 + i}"
            : "https://picsum.photos/600/600?random=${page * _limit * 5 + index * 5 + i}",
      );

      return Post(
        postId: "post_$postIndex",
        userId: "user_$username",
        username: username,
        imageUrls: images,
        hasStory: _random.nextBool(),
        isVerified: special?["verified"] ?? (_random.nextInt(10) > 7),

        userAvatarUrl:
            special?["avatar"] ??
            "https://api.dicebear.com/7.x/adventurer/png?seed=$username",

        caption:
            special?["caption"] ?? _captions[_random.nextInt(_captions.length)],

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
