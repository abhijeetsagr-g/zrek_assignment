import 'package:flutter/material.dart';

class DotIndicators extends StatelessWidget {
  const DotIndicators({
    super.key,
    required this.length,
    required this.currentIndex,
  });
  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (i) {
          final isActive = i == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: isActive ? 8 : 5,
            height: isActive ? 6 : 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? const Color(0xFF0095F6) : Colors.grey[400],
            ),
          );
        }),
      ),
    );
  }
}
