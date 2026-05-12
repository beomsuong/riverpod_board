import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/dummy_data.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';
import 'board_data.dart';

part 'board_provider.g.dart';

const String currentUserId = 'user_1';

/// 모든 게시글의 단일 상태관리자.
/// 본문은 `Map<id, Post>` 로 정규화 저장하고, 정렬·작성자별 인덱스를 별도로 둔다.
/// addPost/toggleLike/addComment 모두 O(1) 본질 작업.
@Riverpod(keepAlive: true)
class BoardNotifier extends _$BoardNotifier {
  @override
  BoardData build() => BoardData.fromPosts(dummyPosts);

  void addPost({required String title, required String content}) {
    final newPost = Post(
      id: 'post_${DateTime.now().millisecondsSinceEpoch}',
      authorId: currentUserId,
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    state = state.copyWith(
      posts: {...state.posts, newPost.id: newPost},
      orderedIds: [newPost.id, ...state.orderedIds],
      byAuthor: {
        ...state.byAuthor,
        currentUserId: [newPost.id, ...?state.byAuthor[currentUserId]],
      },
    );
  }

  void toggleLike(String postId) {
    final post = state.posts[postId];
    if (post == null) return;
    final updated = post.likedUserIds.contains(currentUserId)
        ? post.copyWith(
            likedUserIds: post.likedUserIds
                .where((id) => id != currentUserId)
                .toList(),
          )
        : post.copyWith(
            likedUserIds: [...post.likedUserIds, currentUserId],
          );
    state = state.copyWith(posts: {...state.posts, postId: updated});
  }

  void addComment(String postId, String content) {
    final post = state.posts[postId];
    if (post == null) return;
    final comment = Comment(
      id: 'comment_${DateTime.now().millisecondsSinceEpoch}',
      authorId: currentUserId,
      content: content,
      createdAt: DateTime.now(),
    );
    final updated = post.copyWith(comments: [...post.comments, comment]);
    state = state.copyWith(posts: {...state.posts, postId: updated});
  }
}

@riverpod
Map<String, User> usersMap(Ref ref) {
  return {for (final user in dummyUsers) user.id: user};
}

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
@riverpod
Post? postById(Ref ref, String postId) {
  return ref.watch(
    boardNotifierProvider.select((s) => s.posts[postId]),
  );
}

/// 정렬된 글 ID 목록.
/// orderedIds 참조가 그대로면 select가 알림을 보내지 않아
/// 좋아요·댓글로 인한 PostListPage 리빌드가 발생하지 않는다.
@Riverpod(keepAlive: true)
List<String> postIds(Ref ref) {
  return ref.watch(
    boardNotifierProvider.select((s) => s.orderedIds),
  );
}

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
@riverpod
List<Post> postsByAuthor(Ref ref, String authorId) {
  final ids = ref.watch(
    boardNotifierProvider.select(
      (s) => s.byAuthor[authorId] ?? const <String>[],
    ),
  );
  final result = <Post>[];
  for (final id in ids) {
    final post = ref.watch(postByIdProvider(id));
    if (post != null) result.add(post);
  }
  return result;
}
