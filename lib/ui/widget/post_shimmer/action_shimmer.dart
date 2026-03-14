import 'package:flutter/material.dart';

class ActionShimmer extends StatelessWidget {
  const ActionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget icon() => Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );

    Widget count() => Container(width: 30, height: 12, color: Colors.white);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
      child: Row(
        children: [
          icon(),
          const SizedBox(width: 8),
          count(),
          const SizedBox(width: 16),
          icon(),
          const SizedBox(width: 6),
          count(),
          const SizedBox(width: 16),
          icon(),
          const SizedBox(width: 16),
          icon(),
          const SizedBox(width: 6),
          count(),
          const Spacer(),
          icon(),
        ],
      ),
    );
  }
}
