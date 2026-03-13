import 'package:flutter/material.dart';

class PostCaption extends StatelessWidget {
  const PostCaption({super.key, required this.username, required this.caption});
  final String username;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.black),
          children: [
            TextSpan(
              text: '$username ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                // color: Colors.red,
              ),
            ),
            TextSpan(text: caption),
            const TextSpan(
              text: ' ... more',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
