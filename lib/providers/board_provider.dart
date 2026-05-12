import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/dummy_data.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';
import 'board_data.dart';

part 'board_provider.g.dart';

const String currentUserId = 'user_1';

/// 모든 게시글·댓글의 단일 상태관리자.
/// 본문은 `Map<id, Post>` / `Map<id, Comment>` 로 정규화 저장하고,
/// 정렬·작성자별·글별 인덱스를 별도로 둔다.
@Riverpod(keepAlive: true)
class BoardNotifier extends _$BoardNotifier {
  @override
  BoardData build() => BoardData.initial(
        posts: dummyPosts,
        comments: dummyComments,
      );

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
    if (!state.posts.containsKey(postId)) return;
    final comment = Comment(
      id: 'comment_${DateTime.now().millisecondsSinceEpoch}',
      postId: postId,
      authorId: currentUserId,
      content: content,
      createdAt: DateTime.now(),
    );
    state = state.copyWith(
      comments: {...state.comments, comment.id: comment},
      commentsByPost: {
        ...state.commentsByPost,
        postId: [...?state.commentsByPost[postId], comment.id],
      },
    );
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

/// 특정 댓글만 구독.
@riverpod
Comment? commentById(Ref ref, String commentId) {
  return ref.watch(
    boardNotifierProvider.select((s) => s.comments[commentId]),
  );
}

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
@riverpod
List<Comment> commentsByPost(Ref ref, String postId) {
  final ids = ref.watch(
    boardNotifierProvider.select(
      (s) => s.commentsByPost[postId] ?? const <String>[],
    ),
  );
  final result = <Comment>[];
  for (final id in ids) {
    final c = ref.watch(commentByIdProvider(id));
    if (c != null) result.add(c);
  }
  return result;
}

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
@riverpod
int commentCountByPost(Ref ref, String postId) {
  return ref.watch(
    boardNotifierProvider.select(
      (s) => s.commentsByPost[postId]?.length ?? 0,
    ),
  );
}
