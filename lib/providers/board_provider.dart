import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/dummy_data.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

part 'board_provider.g.dart';

const String currentUserId = 'user_1';

/// 모든 게시글의 원본 데이터를 보관하는 단일 상태관리자.
@Riverpod(keepAlive: true)
class BoardNotifier extends _$BoardNotifier {
  @override
  List<Post> build() => List.from(dummyPosts);

  void addPost({required String title, required String content}) {
    final newPost = Post(
      id: 'post_${DateTime.now().millisecondsSinceEpoch}',
      authorId: currentUserId,
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    state = [newPost, ...state];
  }

  void toggleLike(String postId) {
    state = [
      for (final post in state)
        if (post.id == postId)
          post.likedUserIds.contains(currentUserId)
              ? post.copyWith(
                  likedUserIds: post.likedUserIds
                      .where((id) => id != currentUserId)
                      .toList(),
                )
              : post.copyWith(
                  likedUserIds: [...post.likedUserIds, currentUserId],
                )
        else
          post, // 변경되지 않은 글은 동일한 객체 참조를 유지
    ];
  }

  void addComment(String postId, String content) {
    final comment = Comment(
      id: 'comment_${DateTime.now().millisecondsSinceEpoch}',
      authorId: currentUserId,
      content: content,
      createdAt: DateTime.now(),
    );
    state = [
      for (final post in state)
        if (post.id == postId)
          post.copyWith(comments: [...post.comments, comment])
        else
          post,
    ];
  }
}

@riverpod
Map<String, User> usersMap(Ref ref) {
  return {for (final user in dummyUsers) user.id: user};
}

/// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
@riverpod
Post? postById(Ref ref, String postId) {
  final posts = ref.watch(boardNotifierProvider);
  final matches = posts.where((p) => p.id == postId);
  return matches.isEmpty ? null : matches.first;
}

/// 글 ID 목록 전용 Notifier.
/// listEquals로 실제 ID 구성이 바뀔 때만(글 추가·삭제) state를 갱신하여
/// 좋아요·댓글 변경 시 PostListPage가 리빌드되지 않도록 한다.
@Riverpod(keepAlive: true)
class PostIds extends _$PostIds {
  @override
  List<String> build() {
    ref.listen<List<Post>>(boardNotifierProvider, (_, posts) {
      final newIds = posts.map((p) => p.id).toList();
      if (!listEquals(state, newIds)) state = newIds;
    });
    return ref.read(boardNotifierProvider).map((p) => p.id).toList();
  }
}

/// 특정 작성자의 글 목록 Notifier.
/// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
/// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
@riverpod
class PostsByAuthor extends _$PostsByAuthor {
  @override
  List<Post> build(String authorId) {
    ref.listen<List<Post>>(boardNotifierProvider, (_, posts) {
      final newPosts = posts.where((p) => p.authorId == authorId).toList();
      if (!listEquals(state, newPosts)) state = newPosts;
    });
    return ref
        .read(boardNotifierProvider)
        .where((p) => p.authorId == authorId)
        .toList();
  }
}
