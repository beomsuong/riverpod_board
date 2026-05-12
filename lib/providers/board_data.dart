import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/post.dart';

part 'board_data.freezed.dart';

/// 게시판의 단일 상태 컨테이너.
/// posts: 본문 저장소 (정규화된 Map)
/// orderedIds: 화면 표시 순서
/// byAuthor: 작성자별 글 ID 인덱스
@freezed
class BoardData with _$BoardData {
  const factory BoardData({
    required Map<String, Post> posts,
    required List<String> orderedIds,
    required Map<String, List<String>> byAuthor,
  }) = _BoardData;

  const BoardData._();

  factory BoardData.fromPosts(List<Post> posts) {
    final byAuthor = <String, List<String>>{};
    for (final p in posts) {
      (byAuthor[p.authorId] ??= []).add(p.id);
    }
    return BoardData(
      posts: {for (final p in posts) p.id: p},
      orderedIds: posts.map((p) => p.id).toList(),
      byAuthor: byAuthor,
    );
  }
}
