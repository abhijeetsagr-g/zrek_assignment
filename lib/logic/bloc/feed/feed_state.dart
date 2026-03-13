part of 'feed_bloc.dart';

abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Post> posts;
  int currentPage;
  bool hasMore;

  FeedLoaded({
    required this.posts,
    required this.currentPage,
    required this.hasMore,
  });
}

class FeedError extends FeedState {
  String errorMessage;

  FeedError({required this.errorMessage});
}
