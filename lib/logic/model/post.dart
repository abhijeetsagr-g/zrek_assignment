class Post {
  final String userId;
  final String username;
  final String userAvatarUrl;
  final bool isVerified;

  final String postId;
  final List<String> imageUrls;
  final String caption;

  final DateTime postTime;

  final int likeCount;
  final bool isLiked;
  final bool isSaved;
  final int commentCount;

  Post({
    required this.caption,
    required this.postId,
    required this.imageUrls,
    required this.userId,
    required this.username,
    required this.userAvatarUrl,
    required this.isVerified,
    required this.postTime,
    required this.commentCount,
    required this.likeCount,
    this.isSaved = false,
    this.isLiked = false,
  });

  Post copyWith({bool? isLiked, bool? isSaved, int? likeCount}) {
    return Post(
      userId: userId,
      username: username,
      userAvatarUrl: userAvatarUrl,
      isVerified: isVerified,
      postId: postId,
      imageUrls: imageUrls,
      caption: caption,
      commentCount: commentCount,
      postTime: postTime,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
