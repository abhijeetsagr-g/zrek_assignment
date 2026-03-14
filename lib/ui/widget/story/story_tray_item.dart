import 'package:flutter/material.dart';

class StoryTrayItem extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final bool hasStory;

  const StoryTrayItem({
    super.key,
    required this.avatarUrl,
    required this.username,
    required this.hasStory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: hasStory
                ? const LinearGradient(
                    colors: [
                      Color(0xFFE09B3D),
                      Color(0xFFC74B4B),
                      Color(0xFFBF177E),
                      Color(0xFF7024C4),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                : null,
            color: hasStory ? null : Colors.transparent,
          ),
          child: Container(
            padding: const EdgeInsets.all(
              2,
            ), // white gap between gradient and avatar
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 64,
          child: Text(
            username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
