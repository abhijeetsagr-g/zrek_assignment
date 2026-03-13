part of 'feed_bloc.dart';

abstract class FeedEvent {}

class FeedStarted extends FeedEvent {}

class FeedLoadMore extends FeedEvent {}

class FeedLikeToggled extends FeedEvent {
  String postId;

  FeedLikeToggled(this.postId);
}

class FeedSaveToggled extends FeedEvent {
  String postId;

  FeedSaveToggled(this.postId);
}
