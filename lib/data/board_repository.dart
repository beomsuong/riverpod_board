import '../models/comment.dart';
import '../models/post.dart';
import 'dummy_data.dart';

/// 게시판 데이터 소스.
///
/// 본문은 여기서만 보관한다. provider 레이어는 이 저장소를 조회/갱신만 하고
/// 자기 자신은 정규화된 본문 캐시를 들고 있지 않는다.
/// 본문 provider(`postControllerProvider`/`commentControllerProvider`)는
/// autoDispose라 watch가 끊기면 사라지지만, 데이터 자체는 여기 남아 있으므로
/// 재진입 시 다시 fetch하면 된다.
class BoardRepository {
  BoardRepository._({
    required Map<String, Post> posts,
    required Map<String, Comment> comments,
  })  : _posts = posts,
        _comments = comments;

  factory BoardRepository.seeded() {
    return BoardRepository._(
      posts: {for (final p in dummyPosts) p.id: p},
      comments: {for (final c in dummyComments) c.id: c},
    );
  }

  final Map<String, Post> _posts;
  final Map<String, Comment> _comments;

  Post? fetchPost(String id) => _posts[id];
  Comment? fetchComment(String id) => _comments[id];

  /// 정렬된(작성 순) 전체 글 목록.
  List<Post> fetchAllPosts() => _posts.values.toList();

  /// 특정 작성자의 글 목록.
  ///
  /// 메모리 환경이라 캐시 hydrate가 no-op이지만, 실제 API 전환 시 여기서
  /// `final posts = await api.get(...); for (final p in posts) hydratePost(p);`
  /// 형태로 본문을 응답 한 번에 받아 캐시에 채워 N+1을 피한다.
  List<Post> fetchPostsByAuthor(String authorId) => [
        for (final p in _posts.values)
          if (p.authorId == authorId) p,
      ];

  /// 특정 글의 댓글 목록. fetch 시점에 본문도 동일하게 hydrate된다고 가정.
  List<Comment> fetchCommentsByPost(String postId) => [
        for (final c in _comments.values)
          if (c.postId == postId) c,
      ];

  /// 무조건 덮어쓰기 — 로컬 mutation(좋아요 등) 결과 반영용.
  void putPost(Post post) {
    _posts[post.id] = post;
  }

  /// 외부에서 받아온 데이터로 캐시를 갱신할 때 사용.
  /// 캐시본이 더 최신이면 무시한다(stale-write 방어).
  /// 같은 시각이면 incoming이 동일/구버전일 가능성이 있어 덮어쓰지 않는다.
  void hydratePost(Post incoming) {
    final cached = _posts[incoming.id];
    if (cached == null ||
        cached.effectiveUpdatedAt.isBefore(incoming.effectiveUpdatedAt)) {
      _posts[incoming.id] = incoming;
    }
  }

  void putComment(Comment comment) {
    _comments[comment.id] = comment;
  }
}
