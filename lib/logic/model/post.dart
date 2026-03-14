class Post {
  // User info
  final String userId;
  final String username;
  final String userAvatarUrl;
  final bool hasStory;
  final bool isVerified;

  // Post Info
  final String postId;
  final List<String> imageUrls;
  final String caption;
  final bool isLiked;
  final bool isSaved;

  // Post metadata and counts
  final DateTime postTime;
  final int likeCount;
  final int commentCount;
  final int shareCount;

  Post({
    required this.caption,
    required this.hasStory,
    required this.postId,
    required this.imageUrls,
    required this.userId,
    required this.username,
    required this.userAvatarUrl,
    required this.isVerified,
    required this.postTime,
    required this.commentCount,
    required this.likeCount,
    required this.shareCount,
    this.isSaved = false,
    this.isLiked = false,
  });

  // toggle like, save, etc
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
      hasStory: hasStory,
      shareCount: shareCount,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
