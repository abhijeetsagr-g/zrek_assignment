import 'package:flutter/material.dart';
import 'package:zrek_assignment/core/const/app_icons.dart';

class FeedBottomBar extends StatelessWidget {
  const FeedBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFDBDBDB), width: 0.5)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppIcons.svg(AppIcons.homeFilled, size: 26),
          AppIcons.svg(AppIcons.search, size: 26),
          AppIcons.svg(AppIcons.reel, size: 26),
          AppIcons.svg(AppIcons.share, size: 26),
          ClipOval(
            child: Container(
              width: 32,
              height: 32,
              color: const Color(0xFFEFEFEF),
              child: const Icon(
                Icons.person_outline,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
