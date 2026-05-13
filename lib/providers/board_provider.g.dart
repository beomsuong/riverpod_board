// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 모든 게시글·댓글의 단일 상태관리자.
/// 본문은 `Map<id, Post>` / `Map<id, Comment>` 로 정규화 저장하고,
/// 정렬·작성자별·글별 인덱스를 별도로 둔다.

@ProviderFor(BoardNotifier)
final boardProvider = BoardNotifierProvider._();

/// 모든 게시글·댓글의 단일 상태관리자.
/// 본문은 `Map<id, Post>` / `Map<id, Comment>` 로 정규화 저장하고,
/// 정렬·작성자별·글별 인덱스를 별도로 둔다.
final class BoardNotifierProvider
    extends $NotifierProvider<BoardNotifier, BoardData> {
  /// 모든 게시글·댓글의 단일 상태관리자.
  /// 본문은 `Map<id, Post>` / `Map<id, Comment>` 로 정규화 저장하고,
  /// 정렬·작성자별·글별 인덱스를 별도로 둔다.
  BoardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boardNotifierHash();

  @$internal
  @override
  BoardNotifier create() => BoardNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BoardData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BoardData>(value),
    );
  }
}

String _$boardNotifierHash() => r'9bb97b4801be7f1968b25dcd6fdda61f71ad1fcd';

/// 모든 게시글·댓글의 단일 상태관리자.
/// 본문은 `Map<id, Post>` / `Map<id, Comment>` 로 정규화 저장하고,
/// 정렬·작성자별·글별 인덱스를 별도로 둔다.

abstract class _$BoardNotifier extends $Notifier<BoardData> {
  BoardData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BoardData, BoardData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BoardData, BoardData>,
              BoardData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(usersMap)
final usersMapProvider = UsersMapProvider._();

final class UsersMapProvider
    extends
        $FunctionalProvider<
          Map<String, User>,
          Map<String, User>,
          Map<String, User>
        >
    with $Provider<Map<String, User>> {
  UsersMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersMapHash();

  @$internal
  @override
  $ProviderElement<Map<String, User>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, User> create(Ref ref) {
    return usersMap(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, User> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, User>>(value),
    );
  }
}

String _$usersMapHash() => r'1d34fca0ad1f37a01ef7dbecf6ef3fff89d8f97e';

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.

@ProviderFor(postById)
final postByIdProvider = PostByIdFamily._();

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.

final class PostByIdProvider extends $FunctionalProvider<Post?, Post?, Post?>
    with $Provider<Post?> {
  /// 특정 글만 구독.
  /// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
  PostByIdProvider._({
    required PostByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postByIdHash();

  @override
  String toString() {
    return r'postByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Post?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Post? create(Ref ref) {
    final argument = this.argument as String;
    return postById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Post? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Post?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postByIdHash() => r'c0adae5db7f794064fe0402a47ef6005adfafd92';

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.

final class PostByIdFamily extends $Family
    with $FunctionalFamilyOverride<Post?, String> {
  PostByIdFamily._()
    : super(
        retry: null,
        name: r'postByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 글만 구독.
  /// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.

  PostByIdProvider call(String postId) =>
      PostByIdProvider._(argument: postId, from: this);

  @override
  String toString() => r'postByIdProvider';
}

/// 정렬된 글 ID 목록.
/// orderedIds 참조가 그대로면 select가 알림을 보내지 않아
/// 좋아요·댓글로 인한 PostListPage 리빌드가 발생하지 않는다.

@ProviderFor(postIds)
final postIdsProvider = PostIdsProvider._();

/// 정렬된 글 ID 목록.
/// orderedIds 참조가 그대로면 select가 알림을 보내지 않아
/// 좋아요·댓글로 인한 PostListPage 리빌드가 발생하지 않는다.

final class PostIdsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  /// 정렬된 글 ID 목록.
  /// orderedIds 참조가 그대로면 select가 알림을 보내지 않아
  /// 좋아요·댓글로 인한 PostListPage 리빌드가 발생하지 않는다.
  PostIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postIdsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postIdsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return postIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$postIdsHash() => r'00e1ef7e3d16348156d67824dd493211b64b53c8';

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.

@ProviderFor(postsByAuthor)
final postsByAuthorProvider = PostsByAuthorFamily._();

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.

final class PostsByAuthorProvider
    extends $FunctionalProvider<List<Post>, List<Post>, List<Post>>
    with $Provider<List<Post>> {
  /// 특정 작성자의 글 목록.
  /// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
  /// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
  PostsByAuthorProvider._({
    required PostsByAuthorFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postsByAuthorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postsByAuthorHash();

  @override
  String toString() {
    return r'postsByAuthorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Post>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Post> create(Ref ref) {
    final argument = this.argument as String;
    return postsByAuthor(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Post> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Post>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostsByAuthorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postsByAuthorHash() => r'6b47563753e787016d847a5a6a6fba99fc09e708';

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.

final class PostsByAuthorFamily extends $Family
    with $FunctionalFamilyOverride<List<Post>, String> {
  PostsByAuthorFamily._()
    : super(
        retry: null,
        name: r'postsByAuthorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 작성자의 글 목록.
  /// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
  /// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.

  PostsByAuthorProvider call(String authorId) =>
      PostsByAuthorProvider._(argument: authorId, from: this);

  @override
  String toString() => r'postsByAuthorProvider';
}

/// 특정 댓글만 구독.

@ProviderFor(commentById)
final commentByIdProvider = CommentByIdFamily._();

/// 특정 댓글만 구독.

final class CommentByIdProvider
    extends $FunctionalProvider<Comment?, Comment?, Comment?>
    with $Provider<Comment?> {
  /// 특정 댓글만 구독.
  CommentByIdProvider._({
    required CommentByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentByIdHash();

  @override
  String toString() {
    return r'commentByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Comment?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Comment? create(Ref ref) {
    final argument = this.argument as String;
    return commentById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Comment? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Comment?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentByIdHash() => r'1aa035cec3ec8f6eb3f049575c04a43d66761d0b';

/// 특정 댓글만 구독.

final class CommentByIdFamily extends $Family
    with $FunctionalFamilyOverride<Comment?, String> {
  CommentByIdFamily._()
    : super(
        retry: null,
        name: r'commentByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 댓글만 구독.

  CommentByIdProvider call(String commentId) =>
      CommentByIdProvider._(argument: commentId, from: this);

  @override
  String toString() => r'commentByIdProvider';
}

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.

@ProviderFor(commentsByPost)
final commentsByPostProvider = CommentsByPostFamily._();

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.

final class CommentsByPostProvider
    extends $FunctionalProvider<List<Comment>, List<Comment>, List<Comment>>
    with $Provider<List<Comment>> {
  /// 특정 글의 댓글 목록.
  /// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
  CommentsByPostProvider._({
    required CommentsByPostFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentsByPostProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentsByPostHash();

  @override
  String toString() {
    return r'commentsByPostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Comment>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Comment> create(Ref ref) {
    final argument = this.argument as String;
    return commentsByPost(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Comment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Comment>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsByPostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentsByPostHash() => r'5ea6217fdefd9924f74b857fb17897fa236e4988';

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.

final class CommentsByPostFamily extends $Family
    with $FunctionalFamilyOverride<List<Comment>, String> {
  CommentsByPostFamily._()
    : super(
        retry: null,
        name: r'commentsByPostProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 글의 댓글 목록.
  /// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.

  CommentsByPostProvider call(String postId) =>
      CommentsByPostProvider._(argument: postId, from: this);

  @override
  String toString() => r'commentsByPostProvider';
}

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.

@ProviderFor(commentCountByPost)
final commentCountByPostProvider = CommentCountByPostFamily._();

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.

final class CommentCountByPostProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// 특정 글의 댓글 수.
  /// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
  CommentCountByPostProvider._({
    required CommentCountByPostFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentCountByPostProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentCountByPostHash();

  @override
  String toString() {
    return r'commentCountByPostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as String;
    return commentCountByPost(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentCountByPostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentCountByPostHash() =>
    r'681110d7cb446a1550f547c35a571b7214634418';

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.

final class CommentCountByPostFamily extends $Family
    with $FunctionalFamilyOverride<int, String> {
  CommentCountByPostFamily._()
    : super(
        retry: null,
        name: r'commentCountByPostProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 글의 댓글 수.
  /// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.

  CommentCountByPostProvider call(String postId) =>
      CommentCountByPostProvider._(argument: postId, from: this);

  @override
  String toString() => r'commentCountByPostProvider';
}
