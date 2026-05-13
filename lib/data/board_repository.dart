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

  /// 정렬된(작성 순) 전체 글 ID 목록. 초기 인덱스 시드용.
  List<String> listPostIds() => _posts.keys.toList();

  /// 특정 작성자의 글 ID. 초기 인덱스 시드용.
  List<String> listPostIdsByAuthor(String authorId) => [
        for (final p in _posts.values)
          if (p.authorId == authorId) p.id,
      ];

  /// 특정 글의 댓글 ID. 초기 인덱스 시드용.
  List<String> listCommentIdsByPost(String postId) => [
        for (final c in _comments.values)
          if (c.postId == postId) c.id,
      ];

  void putPost(Post post) {
    _posts[post.id] = post;
  }

  void putComment(Comment comment) {
    _comments[comment.id] = comment;
  }
}
