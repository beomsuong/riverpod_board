import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String authorId,
    required String title,
    required String content,
    required DateTime createdAt,
    @Default([]) List<String> likedUserIds,
    @Default([]) List<Comment> comments,
  }) = _Post;

  const Post._();

  int get likeCount => likedUserIds.length;
  int get commentCount => comments.length;
}
