import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/ui/home/widget/post_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        final state = context.read<FeedBloc>().state;
        if (state is FeedLoaded && state.hasMore) {
          context.read<FeedBloc>().add(FeedLoadMore());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedLoading || state is FeedInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FeedError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is FeedLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasMore
                  ? state.posts.length + 1
                  : state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];

                if (index == state.posts.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                return PostCard(post: post);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
