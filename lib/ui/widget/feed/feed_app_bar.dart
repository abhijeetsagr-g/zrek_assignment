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
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcons.svg(AppIcons.banner, size: 30),
          const Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
      actions: [
        AppIcons.svg(AppIcons.like, size: 26),
        const SizedBox(width: 16),
      ],
    );
  }
}
