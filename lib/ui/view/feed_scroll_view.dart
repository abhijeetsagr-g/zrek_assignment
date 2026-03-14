import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinch_scrollable/pinch_scrollable.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/ui/widget/feed/feed_app_bar.dart';
import 'package:zrek_assignment/ui/widget/post/post_card.dart';
import 'package:zrek_assignment/ui/widget/post_shimmer/post_card_shimmer.dart';
import 'package:zrek_assignment/ui/widget/shimmer/stories_tray_shimmer.dart';
import 'package:zrek_assignment/ui/widget/story/story_tray.dart';

class FeedScrollView extends StatefulWidget {
  const FeedScrollView({super.key});

  @override
  State<FeedScrollView> createState() => _FeedScrollViewState();
}

class _FeedScrollViewState extends State<FeedScrollView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      final state = context.read<FeedBloc>().state;
      if (state is FeedLoaded && state.hasMore && !state.isFetchingMore) {
        context.read<FeedBloc>().add(FeedLoadMore());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        final isLoading = state is FeedLoading || state is FeedInitial;

        return PinchScrollableArea(
          child: Builder(
            builder: (builderContext) => CustomScrollView(
              controller: _scrollController,
              physics: PinchScrollLockPhysics.build(builderContext),
              slivers: [
                const FeedAppBar(),
                if (isLoading) const StoriesTrayShimmer(),
                if (state is FeedLoaded) StoryTray(posts: state.posts),
                if (isLoading)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, _) => const PostCardShimmer(),
                      childCount: 5,
                    ),
                  )
                else if (state is FeedLoaded)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == state.posts.length) {
                          return const PostCardShimmer();
                        }
                        return PostCard(post: state.posts[index]);
                      },
                      childCount: state.isFetchingMore
                          ? state.posts.length + 1
                          : state.posts.length,
                    ),
                  )
                else if (state is FeedError)
                  SliverFillRemaining(
                    child: Center(child: Text(state.errorMessage)),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
