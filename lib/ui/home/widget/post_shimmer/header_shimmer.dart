import 'package:flutter/material.dart';

class HeaderShimmer extends StatelessWidget {
  const HeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Row(
              children: [
                Container(width: 90, height: 12, color: Colors.white),
                const SizedBox(width: 6),
                Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Container(width: 20, height: 20, color: Colors.white),
        ],
      ),
    );
  }
}
