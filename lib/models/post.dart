import 'comment.dart';

class Post {
  const Post({
    required this.id,
    required this.authorId,
    required this.title,
    required this.content,
    required this.createdAt,
    this.likedUserIds = const [],
    this.comments = const [],
  });

  final String id;
  final String authorId;
  final String title;
  final String content;
  final DateTime createdAt;
  final List<String> likedUserIds;
  final List<Comment> comments;

  int get likeCount => likedUserIds.length;
  int get commentCount => comments.length;

  Post copyWith({
    List<String>? likedUserIds,
    List<Comment>? comments,
  }) {
    return Post(
      id: id,
      authorId: authorId,
      title: title,
      content: content,
      createdAt: createdAt,
      likedUserIds: likedUserIds ?? this.likedUserIds,
      comments: comments ?? this.comments,
    );
  }
}
