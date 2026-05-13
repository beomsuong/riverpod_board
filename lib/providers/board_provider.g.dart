// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 데이터 소스. 본문은 여기서만 보관한다.
/// keepAlive — 앱 전역에서 단일 인스턴스.

@ProviderFor(boardRepository)
final boardRepositoryProvider = BoardRepositoryProvider._();

/// 데이터 소스. 본문은 여기서만 보관한다.
/// keepAlive — 앱 전역에서 단일 인스턴스.

final class BoardRepositoryProvider
    extends
        $FunctionalProvider<BoardRepository, BoardRepository, BoardRepository>
    with $Provider<BoardRepository> {
  /// 데이터 소스. 본문은 여기서만 보관한다.
  /// keepAlive — 앱 전역에서 단일 인스턴스.
  BoardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boardRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boardRepositoryHash();

  @$internal
  @override
  $ProviderElement<BoardRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BoardRepository create(Ref ref) {
    return boardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BoardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BoardRepository>(value),
    );
  }
}

String _$boardRepositoryHash() => r'26455353bf06e830dda9f162159d50f8da472f8f';

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

/// 정렬된 전체 글 ID 목록.
/// 게시판 진입의 기준 인덱스라 keepAlive로 둔다.

@ProviderFor(PostIds)
final postIdsProvider = PostIdsProvider._();

/// 정렬된 전체 글 ID 목록.
/// 게시판 진입의 기준 인덱스라 keepAlive로 둔다.
final class PostIdsProvider extends $NotifierProvider<PostIds, List<String>> {
  /// 정렬된 전체 글 ID 목록.
  /// 게시판 진입의 기준 인덱스라 keepAlive로 둔다.
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
  PostIds create() => PostIds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$postIdsHash() => r'5077e7c7142d4e67b1b436f5f8844325dc989cd5';

/// 정렬된 전체 글 ID 목록.
/// 게시판 진입의 기준 인덱스라 keepAlive로 둔다.

abstract class _$PostIds extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
/// 페이지를 떠나면 인덱스도 같이 사라진다. 다음 진입 시 repository에서 재시드.

@ProviderFor(PostIdsByAuthor)
final postIdsByAuthorProvider = PostIdsByAuthorFamily._();

/// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
/// 페이지를 떠나면 인덱스도 같이 사라진다. 다음 진입 시 repository에서 재시드.
final class PostIdsByAuthorProvider
    extends $NotifierProvider<PostIdsByAuthor, List<String>> {
  /// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
  /// 페이지를 떠나면 인덱스도 같이 사라진다. 다음 진입 시 repository에서 재시드.
  PostIdsByAuthorProvider._({
    required PostIdsByAuthorFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postIdsByAuthorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postIdsByAuthorHash();

  @override
  String toString() {
    return r'postIdsByAuthorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostIdsByAuthor create() => PostIdsByAuthor();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostIdsByAuthorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postIdsByAuthorHash() => r'4c6952c2b9692ce4bb0b8a2465662c72e4c0a9f6';

/// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
/// 페이지를 떠나면 인덱스도 같이 사라진다. 다음 진입 시 repository에서 재시드.

final class PostIdsByAuthorFamily extends $Family
    with
        $ClassFamilyOverride<
          PostIdsByAuthor,
          List<String>,
          List<String>,
          List<String>,
          String
        > {
  PostIdsByAuthorFamily._()
    : super(
        retry: null,
        name: r'postIdsByAuthorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
  /// 페이지를 떠나면 인덱스도 같이 사라진다. 다음 진입 시 repository에서 재시드.

  PostIdsByAuthorProvider call(String authorId) =>
      PostIdsByAuthorProvider._(argument: authorId, from: this);

  @override
  String toString() => r'postIdsByAuthorProvider';
}

/// 특정 작성자의 글 ID 목록. 프로필 페이지에서만 쓰이므로 autoDispose.
/// 페이지를 떠나면 인덱스도 같이 사라진다. 다음 진입 시 repository에서 재시드.

abstract class _$PostIdsByAuthor extends $Notifier<List<String>> {
  late final _$args = ref.$arg as String;
  String get authorId => _$args;

  List<String> build(String authorId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// 특정 글의 댓글 ID 목록.
/// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.

@ProviderFor(CommentIdsByPost)
final commentIdsByPostProvider = CommentIdsByPostFamily._();

/// 특정 글의 댓글 ID 목록.
/// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.
final class CommentIdsByPostProvider
    extends $NotifierProvider<CommentIdsByPost, List<String>> {
  /// 특정 글의 댓글 ID 목록.
  /// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.
  CommentIdsByPostProvider._({
    required CommentIdsByPostFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentIdsByPostProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentIdsByPostHash();

  @override
  String toString() {
    return r'commentIdsByPostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommentIdsByPost create() => CommentIdsByPost();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentIdsByPostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentIdsByPostHash() => r'297b9419800fe896440204840e41df967ffbbc62';

/// 특정 글의 댓글 ID 목록.
/// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.

final class CommentIdsByPostFamily extends $Family
    with
        $ClassFamilyOverride<
          CommentIdsByPost,
          List<String>,
          List<String>,
          List<String>,
          String
        > {
  CommentIdsByPostFamily._()
    : super(
        retry: null,
        name: r'commentIdsByPostProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 글의 댓글 ID 목록.
  /// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.

  CommentIdsByPostProvider call(String postId) =>
      CommentIdsByPostProvider._(argument: postId, from: this);

  @override
  String toString() => r'commentIdsByPostProvider';
}

/// 특정 글의 댓글 ID 목록.
/// 상세 페이지 + 리스트의 댓글 수 뱃지에서 쓰이며, autoDispose.

abstract class _$CommentIdsByPost extends $Notifier<List<String>> {
  late final _$args = ref.$arg as String;
  String get postId => _$args;

  List<String> build(String postId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// 본문 분산 캐시 — 글 1건.
/// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
/// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.

@ProviderFor(PostController)
final postControllerProvider = PostControllerFamily._();

/// 본문 분산 캐시 — 글 1건.
/// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
/// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.
final class PostControllerProvider
    extends $NotifierProvider<PostController, Post?> {
  /// 본문 분산 캐시 — 글 1건.
  /// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
  /// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.
  PostControllerProvider._({
    required PostControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'postControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postControllerHash();

  @override
  String toString() {
    return r'postControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostController create() => PostController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Post? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Post?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postControllerHash() => r'3b3bf9ea1549c506af712be62218579b2ed70482';

/// 본문 분산 캐시 — 글 1건.
/// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
/// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.

final class PostControllerFamily extends $Family
    with $ClassFamilyOverride<PostController, Post?, Post?, Post?, String> {
  PostControllerFamily._()
    : super(
        retry: null,
        name: r'postControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 본문 분산 캐시 — 글 1건.
  /// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
  /// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.

  PostControllerProvider call(String postId) =>
      PostControllerProvider._(argument: postId, from: this);

  @override
  String toString() => r'postControllerProvider';
}

/// 본문 분산 캐시 — 글 1건.
/// autoDispose 라 watch가 끊기는 순간 element/state 모두 사라진다.
/// 본문은 repository에 남아 있으므로 재진입 시 다시 fetch한다.

abstract class _$PostController extends $Notifier<Post?> {
  late final _$args = ref.$arg as String;
  String get postId => _$args;

  Post? build(String postId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Post?, Post?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Post?, Post?>,
              Post?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.

@ProviderFor(CommentController)
final commentControllerProvider = CommentControllerFamily._();

/// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.
final class CommentControllerProvider
    extends $NotifierProvider<CommentController, Comment?> {
  /// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.
  CommentControllerProvider._({
    required CommentControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentControllerHash();

  @override
  String toString() {
    return r'commentControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommentController create() => CommentController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Comment? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Comment?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentControllerHash() => r'13c1414be15e01a21e6c63551f2710b6d0cc1f25';

/// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.

final class CommentControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CommentController,
          Comment?,
          Comment?,
          Comment?,
          String
        > {
  CommentControllerFamily._()
    : super(
        retry: null,
        name: r'commentControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.

  CommentControllerProvider call(String commentId) =>
      CommentControllerProvider._(argument: commentId, from: this);

  @override
  String toString() => r'commentControllerProvider';
}

/// 본문 분산 캐시 — 댓글 1건. 글과 동일하게 autoDispose.

abstract class _$CommentController extends $Notifier<Comment?> {
  late final _$args = ref.$arg as String;
  String get commentId => _$args;

  Comment? build(String commentId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Comment?, Comment?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Comment?, Comment?>,
              Comment?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// 도메인 액션 — 인덱스/저장소를 함께 만져야 하는 mutation 모음.
/// 단일 책임의 notifier에 둘 수 없는 cross-cutting 동작만 여기에 있다.

@ProviderFor(BoardActions)
final boardActionsProvider = BoardActionsProvider._();

/// 도메인 액션 — 인덱스/저장소를 함께 만져야 하는 mutation 모음.
/// 단일 책임의 notifier에 둘 수 없는 cross-cutting 동작만 여기에 있다.
final class BoardActionsProvider extends $NotifierProvider<BoardActions, void> {
  /// 도메인 액션 — 인덱스/저장소를 함께 만져야 하는 mutation 모음.
  /// 단일 책임의 notifier에 둘 수 없는 cross-cutting 동작만 여기에 있다.
  BoardActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boardActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boardActionsHash();

  @$internal
  @override
  BoardActions create() => BoardActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$boardActionsHash() => r'5b5756aeac38429079b9f9299b4b5e8847db1e5d';

/// 도메인 액션 — 인덱스/저장소를 함께 만져야 하는 mutation 모음.
/// 단일 책임의 notifier에 둘 수 없는 cross-cutting 동작만 여기에 있다.

abstract class _$BoardActions extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
