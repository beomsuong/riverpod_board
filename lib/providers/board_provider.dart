import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/board_repository.dart';
import '../data/dummy_data.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

part 'board_provider.g.dart';

const String currentUserId = 'user_1';

/// 데이터 소스. 본문은 여기서만 보관한다.
/// keepAlive — 앱 전역에서 단일 인스턴스.
@Riverpod(keepAlive: true)
BoardRepository boardRepository(Ref ref) => BoardRepository.seeded();

@riverpod
Map<String, User> usersMap(Ref ref) {
  return {for (final user in dummyUsers) user.id: user};
}

/// 정렬된 전체 글 ID 목록.
/// 게시판 진입의 기준 인덱스라 keepAlive로 둔다.
///
/// fetch 시 본문 리스트를 한 번에 받아 repository에 hydrate되고, state엔
/// ID만 보관한다. 본문은 `postControllerProvider(id)`가 캐시에서 꺼낸다.
@Riverpod(keepAlive: true)
class PostIds extends _$PostIds {
  @override
  List<String> build() {
    final posts = ref.read(boardRepositoryProvider).fetchAllPosts();
    return [for (final p in posts) p.id];
  }

  void prepend(String postId) => state = [postId, ...state];
}

/// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
/// fetch 시 본문도 한 번에 받아 repository에 hydrate된다(N+1 회피).
@riverpod
class PostIdsByAuthor extends _$PostIdsByAuthor {
  @override
  List<String> build(String authorId) {
    final posts = ref
        .read(boardRepositoryProvider)
        .fetchPostsByAuthor(authorId);
    return [for (final p in posts) p.id];
  }

  void prepend(String postId) => state = [postId, ...state];
}

/// 특정 글의 댓글 ID 목록.
/// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.
@riverpod
class CommentIdsByPost extends _$CommentIdsByPost {
  @override
  List<String> build(String postId) {
    final comments = ref
        .read(boardRepositoryProvider)
        .fetchCommentsByPost(postId);
    return [for (final c in comments) c.id];
  }

  void append(String commentId) => state = [...state, commentId];
}

/// 본문 분산 캐시 — 글 1건.
/// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
/// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.
@riverpod
class PostController extends _$PostController {
  @override
  Post? build(String postId) =>
      ref.read(boardRepositoryProvider).fetchPost(postId);

  void toggleLike() {
    final post = state;
    if (post == null) return;
    final liked = post.likedUserIds.contains(currentUserId);
    final updated = post.copyWith(
      likedUserIds: liked
          ? post.likedUserIds.where((id) => id != currentUserId).toList()
          : [...post.likedUserIds, currentUserId],
      updatedAt: DateTime.now(),
    );
    ref.read(boardRepositoryProvider).putPost(updated);
    state = updated;
  }
}

/// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.
@riverpod
class CommentController extends _$CommentController {
  @override
  Comment? build(String commentId) =>
      ref.read(boardRepositoryProvider).fetchComment(commentId);
}

/// 도메인 액션 — 인덱스/저장소를 함께 만져야 하는 mutation 모음.
/// 단일 책임의 notifier에 둘 수 없는 cross-cutting 동작만 여기에 있다.
@riverpod
class BoardActions extends _$BoardActions {
  @override
  void build() {}

  void addPost({required String title, required String content}) {
    final post = Post(
      id: 'post_${DateTime.now().millisecondsSinceEpoch}',
      authorId: currentUserId,
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    ref.read(boardRepositoryProvider).putPost(post);
    ref.read(postIdsProvider.notifier).prepend(post.id);
    // 작성자 인덱스가 활성이면 prepend, 아니면 다음 build에서 자연 반영.
    if (ref.exists(postIdsByAuthorProvider(currentUserId))) {
      ref.read(postIdsByAuthorProvider(currentUserId).notifier).prepend(post.id);
    }
  }

  void addComment(String postId, String content) {
    final repo = ref.read(boardRepositoryProvider);
    if (repo.fetchPost(postId) == null) return;
    final comment = Comment(
      id: 'comment_${DateTime.now().millisecondsSinceEpoch}',
      postId: postId,
      authorId: currentUserId,
      content: content,
      createdAt: DateTime.now(),
    );
    repo.putComment(comment);
    ref.read(commentIdsByPostProvider(postId).notifier).append(comment.id);
  }
}
