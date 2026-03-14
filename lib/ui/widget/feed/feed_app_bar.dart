import 'package:flutter/material.dart';
import 'package:zrek_assignment/core/const/app_icons.dart';

class FeedAppBar extends StatelessWidget {
  const FeedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      centerTitle: true,
      leading: Icon(Icons.add),
      title: GestureDetector(
        onTap: () {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(100, 80, 100, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            items: [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.people_outline),
                    SizedBox(width: 12),
                    Text('Following'),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.star_border),
                    SizedBox(width: 12),
                    Text('Favorites'),
                  ],
                ),
              ),
            ],
          );
        },

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcons.svg(AppIcons.banner, size: 30),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            AppIcons.svg(AppIcons.like, size: 26),
            Positioned(
              top: 1,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
