import 'package:flutter/material.dart';
import 'package:zrek_assignment/core/const/app_icons.dart';
import 'package:zrek_assignment/core/utils/show_snackbar.dart';

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
          GestureDetector(
            onTap: () => showUnimplementedSnackbar(context, 'Reels'),
            child: AppIcons.svg(AppIcons.reel, size: 26),
          ),
          GestureDetector(
            onTap: () => showUnimplementedSnackbar(context, 'Messages'),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AppIcons.svg(AppIcons.share, size: 26),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        '9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => showUnimplementedSnackbar(context, 'Search'),
            child: AppIcons.svg(AppIcons.search, size: 26),
          ),
          GestureDetector(
            onTap: () => showUnimplementedSnackbar(context, 'Profile'),
            child: ClipOval(
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
          ),
        ],
      ),
    );
  }
}
