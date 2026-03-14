import 'package:flutter/material.dart';

class CaptionShimmer extends StatelessWidget {
  const CaptionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 140, height: 12, color: Colors.white),
          const SizedBox(height: 6),
          Container(width: 220, height: 12, color: Colors.white),
        ],
      ),
    );
  }
}
