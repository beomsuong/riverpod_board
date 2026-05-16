import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    required String authorId,
    required String title,
    required String content,
    required DateTime createdAt,
    /// 본문이 수정된 적이 없으면 null. 비교 시 [effectiveUpdatedAt] 사용.
    DateTime? updatedAt,
    @Default([]) List<String> likedUserIds,
  }) = _Post;

  const Post._();

  int get likeCount => likedUserIds.length;

  /// 캐시 신선도 비교용. 수정 이력이 없으면 createdAt을 사용한다.
  DateTime get effectiveUpdatedAt => updatedAt ?? createdAt;
}
