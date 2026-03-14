import 'package:flutter/material.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/ui/widget/story_tray_item.dart';

class StoryTray extends StatelessWidget {
  final List<Post> posts;
  const StoryTray({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final storyUsers = posts.where((p) => p.hasStory).toList();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: storyUsers.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: _YourStoryItem(),
              );
            }
            final post = storyUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: StoryTrayItem(
                avatarUrl: post.userAvatarUrl,
                username: post.username,
                hasStory: post.hasStory,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _YourStoryItem extends StatelessWidget {
  const _YourStoryItem();

  @override
  Widget build(BuildContext context) {
    final double size = 82.0;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFDBDBDB)),
              ),
              child: ClipOval(
                child: Container(
                  width: size,
                  height: size,
                  color: const Color(0xFFEFEFEF), // light grey background
                  child: const Icon(
                    Icons.person_outline,
                    size: 42,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0095F6),
                ),
                child: const Icon(Icons.add, size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const SizedBox(
          width: 64,
          child: Text(
            "Your story",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
