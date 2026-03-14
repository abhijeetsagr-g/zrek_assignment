import 'package:flutter/material.dart';

class TimeShimmer extends StatelessWidget {
  const TimeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(width: 80, height: 10, color: Colors.white),
    );
  }
}
