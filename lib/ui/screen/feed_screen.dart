import 'package:flutter/material.dart';
import 'package:pinch_scrollable/pinch_scrollable.dart';
import 'package:zrek_assignment/ui/view/feed_scroll_view.dart';
import 'package:zrek_assignment/ui/widget/feed/feed_bottom_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PinchScrollableArea(
      child: Scaffold(
        bottomNavigationBar: const FeedBottomBar(),
        body: const FeedScrollView(),
      ),
    );
  }
}
