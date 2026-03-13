import 'package:flutter/material.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/ui/home/widget/post_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return PostCard(
            post: Post(
              userId: "user_alex",
              username: "alex",
              userAvatarUrl:
                  "https://api.dicebear.com/7.x/adventurer/png?seed=alex",
              userStory: index % 2 == 0,
              isVerified: index % 3 == 0,
              postId: "post_$index",
              imageUrls: [
                "https://picsum.photos/600/600?random=${index * 3}",
                "https://picsum.photos/600/600?random=${index * 3 + 1}",
              ],
              caption: "Golden hour hits different ✨",
              postTime: DateTime.now().subtract(Duration(hours: index + 1)),
              likeCount: 128 + index * 10,
              commentCount: 24,
              shareCount: 7,
            ),
          );
        },
      ),
    );
  }
}
