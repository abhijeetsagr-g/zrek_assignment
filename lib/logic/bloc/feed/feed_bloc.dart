import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrek_assignment/logic/model/post.dart';
import 'package:zrek_assignment/logic/repository/post_repository.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final PostRepository _repo = PostRepository();

  FeedBloc() : super(FeedInitial()) {
    on<FeedStarted>((event, emit) async {
      emit(FeedLoading());
      try {
        final posts = await _repo.fetchPosts(0);
        emit(FeedLoaded(posts: posts, currentPage: 0, hasMore: true));
      } catch (e) {
        emit(FeedError(errorMessage: e.toString()));
      }
    });

    on<FeedLoadMore>((event, emit) async {
      if (state is! FeedLoaded) return;
      final current = state as FeedLoaded;
      emit(current.copyWith(isFetchingMore: true));
      try {
        final newPosts = await _repo.fetchPosts(current.currentPage + 1);
        emit(
          current.copyWith(
            posts: [...current.posts, ...newPosts],
            currentPage: current.currentPage + 1,
            hasMore: newPosts.isNotEmpty,
            isFetchingMore: false,
          ),
        );
      } catch (e) {
        emit(FeedError(errorMessage: e.toString()));
      }
    });

    on<FeedLikeToggled>((event, emit) {
      final current = state as FeedLoaded;
      final updated = current.posts.map((p) {
        if (p.postId != event.postId) return p;
        return p.copyWith(
          isLiked: !p.isLiked,
          likeCount: p.isLiked ? p.likeCount - 1 : p.likeCount + 1,
        );
      }).toList();
      emit(
        FeedLoaded(
          posts: updated,
          currentPage: current.currentPage,
          hasMore: current.hasMore,
        ),
      );
    });

    on<FeedSaveToggled>((event, emit) {
      final current = state as FeedLoaded;
      final updated = current.posts.map((p) {
        if (p.postId != event.postId) return p;
        return p.copyWith(isSaved: !p.isSaved);
      }).toList();

      emit(
        FeedLoaded(
          posts: updated,
          currentPage: current.currentPage,
          hasMore: current.hasMore,
        ),
      );
    });
  }
}
