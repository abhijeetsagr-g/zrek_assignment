part of 'feed_bloc.dart';

abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Post> posts;
  final int currentPage;
  final bool hasMore;
  final bool isFetchingMore;

  FeedLoaded({
    required this.posts,
    required this.currentPage,
    required this.hasMore,
    this.isFetchingMore = false,
  });

  FeedLoaded copyWith({
    List<Post>? posts,
    int? currentPage,
    bool? hasMore,
    bool? isFetchingMore,
  }) {
    return FeedLoaded(
      posts: posts ?? this.posts,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}

class FeedError extends FeedState {
  final String errorMessage;

  FeedError({required this.errorMessage});
}
