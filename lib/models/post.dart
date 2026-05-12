import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Post;

  const Post._();

  int get likeCount => likedUserIds.length;
}
