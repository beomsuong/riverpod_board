import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/comment.dart';
import '../models/post.dart';

part 'board_data.freezed.dart';

/// 게시판의 단일 상태 컨테이너.
///
/// 본문 저장소(정규화):
/// - posts:    `Map<postId, Post>`
/// - comments: `Map<commentId, Comment>`
///
/// 인덱스(ID 참조만):
/// - orderedIds:      글 표시 순서
/// - byAuthor:        작성자별 글 ID 목록
/// - commentsByPost:  글별 댓글 ID 목록
@freezed
class BoardData with _$BoardData {
  const factory BoardData({
    required Map<String, Post> posts,
    required List<String> orderedIds,
    required Map<String, List<String>> byAuthor,
    required Map<String, Comment> comments,
    required Map<String, List<String>> commentsByPost,
  }) = _BoardData;

  const BoardData._();

  factory BoardData.initial({
    required List<Post> posts,
    required List<Comment> comments,
  }) {
    final byAuthor = <String, List<String>>{};
    for (final p in posts) {
      (byAuthor[p.authorId] ??= []).add(p.id);
    }
    final commentsByPost = <String, List<String>>{};
    for (final c in comments) {
      (commentsByPost[c.postId] ??= []).add(c.id);
    }
    return BoardData(
      posts: {for (final p in posts) p.id: p},
      orderedIds: posts.map((p) => p.id).toList(),
      byAuthor: byAuthor,
      comments: {for (final c in comments) c.id: c},
      commentsByPost: commentsByPost,
    );
  }
}
