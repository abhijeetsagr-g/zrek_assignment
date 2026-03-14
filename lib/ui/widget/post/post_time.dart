import 'package:flutter/material.dart';

class PostTime extends StatelessWidget {
  const PostTime({super.key, required this.postTime});
  final DateTime postTime;

  String _formatTime(DateTime postTime) {
    final diff = DateTime.now().difference(postTime);
    if (diff.inSeconds < 60) return '${diff.inSeconds} seconds ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes} minutes ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        _formatTime(postTime),
        style: const TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }
}
