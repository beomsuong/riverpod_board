// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersMapHash() => r'1d34fca0ad1f37a01ef7dbecf6ef3fff89d8f97e';

/// See also [usersMap].
@ProviderFor(usersMap)
final usersMapProvider = AutoDisposeProvider<Map<String, User>>.internal(
  usersMap,
  name: r'usersMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersMapRef = AutoDisposeProviderRef<Map<String, User>>;
String _$postByIdHash() => r'2eaef8f9a6689cf25008946dbb7fdb43a675e28c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
///
/// Copied from [postById].
@ProviderFor(postById)
const postByIdProvider = PostByIdFamily();

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
///
/// Copied from [postById].
class PostByIdFamily extends Family<Post?> {
  /// 특정 글만 구독.
  /// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
  ///
  /// Copied from [postById].
  const PostByIdFamily();

  /// 특정 글만 구독.
  /// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
  ///
  /// Copied from [postById].
  PostByIdProvider call(String postId) {
    return PostByIdProvider(postId);
  }

  @override
  PostByIdProvider getProviderOverride(covariant PostByIdProvider provider) {
    return call(provider.postId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postByIdProvider';
}

/// 특정 글만 구독.
/// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
///
/// Copied from [postById].
class PostByIdProvider extends AutoDisposeProvider<Post?> {
  /// 특정 글만 구독.
  /// posts[id]가 동일 객체면 select가 알림을 보내지 않아 다른 글 변경 시 재실행되지 않는다.
  ///
  /// Copied from [postById].
  PostByIdProvider(String postId)
    : this._internal(
        (ref) => postById(ref as PostByIdRef, postId),
        from: postByIdProvider,
        name: r'postByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$postByIdHash,
        dependencies: PostByIdFamily._dependencies,
        allTransitiveDependencies: PostByIdFamily._allTransitiveDependencies,
        postId: postId,
      );

  PostByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(Post? Function(PostByIdRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: PostByIdProvider._internal(
        (ref) => create(ref as PostByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Post?> createElement() {
    return _PostByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostByIdProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostByIdRef on AutoDisposeProviderRef<Post?> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _PostByIdProviderElement extends AutoDisposeProviderElement<Post?>
    with PostByIdRef {
  _PostByIdProviderElement(super.provider);

  @override
  String get postId => (origin as PostByIdProvider).postId;
}

String _$postIdsHash() => r'c9cfdc3bbe9c514612b2db6aab3a3fe02ff43d4c';

/// 정렬된 글 ID 목록.
/// orderedIds 참조가 그대로면 select가 알림을 보내지 않아
/// 좋아요·댓글로 인한 PostListPage 리빌드가 발생하지 않는다.
///
/// Copied from [postIds].
@ProviderFor(postIds)
final postIdsProvider = Provider<List<String>>.internal(
  postIds,
  name: r'postIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PostIdsRef = ProviderRef<List<String>>;
String _$postsByAuthorHash() => r'8200f0d9f08ba6afc27f418ded1020a59d81ffec';

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
///
/// Copied from [postsByAuthor].
@ProviderFor(postsByAuthor)
const postsByAuthorProvider = PostsByAuthorFamily();

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
///
/// Copied from [postsByAuthor].
class PostsByAuthorFamily extends Family<List<Post>> {
  /// 특정 작성자의 글 목록.
  /// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
  /// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
  ///
  /// Copied from [postsByAuthor].
  const PostsByAuthorFamily();

  /// 특정 작성자의 글 목록.
  /// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
  /// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
  ///
  /// Copied from [postsByAuthor].
  PostsByAuthorProvider call(String authorId) {
    return PostsByAuthorProvider(authorId);
  }

  @override
  PostsByAuthorProvider getProviderOverride(
    covariant PostsByAuthorProvider provider,
  ) {
    return call(provider.authorId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postsByAuthorProvider';
}

/// 특정 작성자의 글 목록.
/// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
/// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
///
/// Copied from [postsByAuthor].
class PostsByAuthorProvider extends AutoDisposeProvider<List<Post>> {
  /// 특정 작성자의 글 목록.
  /// byAuthor[authorId]가 그대로면 ids는 동일 참조 → 다른 작성자 글 변경 시 재실행되지 않는다.
  /// 본인 글이 바뀌면 postByIdProvider 알림으로 재실행되어 갱신된 본문을 반환한다.
  ///
  /// Copied from [postsByAuthor].
  PostsByAuthorProvider(String authorId)
    : this._internal(
        (ref) => postsByAuthor(ref as PostsByAuthorRef, authorId),
        from: postsByAuthorProvider,
        name: r'postsByAuthorProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$postsByAuthorHash,
        dependencies: PostsByAuthorFamily._dependencies,
        allTransitiveDependencies:
            PostsByAuthorFamily._allTransitiveDependencies,
        authorId: authorId,
      );

  PostsByAuthorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authorId,
  }) : super.internal();

  final String authorId;

  @override
  Override overrideWith(List<Post> Function(PostsByAuthorRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: PostsByAuthorProvider._internal(
        (ref) => create(ref as PostsByAuthorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authorId: authorId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Post>> createElement() {
    return _PostsByAuthorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostsByAuthorProvider && other.authorId == authorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostsByAuthorRef on AutoDisposeProviderRef<List<Post>> {
  /// The parameter `authorId` of this provider.
  String get authorId;
}

class _PostsByAuthorProviderElement
    extends AutoDisposeProviderElement<List<Post>>
    with PostsByAuthorRef {
  _PostsByAuthorProviderElement(super.provider);

  @override
  String get authorId => (origin as PostsByAuthorProvider).authorId;
}

String _$commentByIdHash() => r'413c464237f729dc0ec0f4926d2a78737d70a0c9';

/// 특정 댓글만 구독.
///
/// Copied from [commentById].
@ProviderFor(commentById)
const commentByIdProvider = CommentByIdFamily();

/// 특정 댓글만 구독.
///
/// Copied from [commentById].
class CommentByIdFamily extends Family<Comment?> {
  /// 특정 댓글만 구독.
  ///
  /// Copied from [commentById].
  const CommentByIdFamily();

  /// 특정 댓글만 구독.
  ///
  /// Copied from [commentById].
  CommentByIdProvider call(String commentId) {
    return CommentByIdProvider(commentId);
  }

  @override
  CommentByIdProvider getProviderOverride(
    covariant CommentByIdProvider provider,
  ) {
    return call(provider.commentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commentByIdProvider';
}

/// 특정 댓글만 구독.
///
/// Copied from [commentById].
class CommentByIdProvider extends AutoDisposeProvider<Comment?> {
  /// 특정 댓글만 구독.
  ///
  /// Copied from [commentById].
  CommentByIdProvider(String commentId)
    : this._internal(
        (ref) => commentById(ref as CommentByIdRef, commentId),
        from: commentByIdProvider,
        name: r'commentByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$commentByIdHash,
        dependencies: CommentByIdFamily._dependencies,
        allTransitiveDependencies: CommentByIdFamily._allTransitiveDependencies,
        commentId: commentId,
      );

  CommentByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commentId,
  }) : super.internal();

  final String commentId;

  @override
  Override overrideWith(Comment? Function(CommentByIdRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: CommentByIdProvider._internal(
        (ref) => create(ref as CommentByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commentId: commentId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Comment?> createElement() {
    return _CommentByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentByIdProvider && other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommentByIdRef on AutoDisposeProviderRef<Comment?> {
  /// The parameter `commentId` of this provider.
  String get commentId;
}

class _CommentByIdProviderElement extends AutoDisposeProviderElement<Comment?>
    with CommentByIdRef {
  _CommentByIdProviderElement(super.provider);

  @override
  String get commentId => (origin as CommentByIdProvider).commentId;
}

String _$commentsByPostHash() => r'2f17076c66106e208509632283d9e796d8844dc6';

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
///
/// Copied from [commentsByPost].
@ProviderFor(commentsByPost)
const commentsByPostProvider = CommentsByPostFamily();

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
///
/// Copied from [commentsByPost].
class CommentsByPostFamily extends Family<List<Comment>> {
  /// 특정 글의 댓글 목록.
  /// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
  ///
  /// Copied from [commentsByPost].
  const CommentsByPostFamily();

  /// 특정 글의 댓글 목록.
  /// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
  ///
  /// Copied from [commentsByPost].
  CommentsByPostProvider call(String postId) {
    return CommentsByPostProvider(postId);
  }

  @override
  CommentsByPostProvider getProviderOverride(
    covariant CommentsByPostProvider provider,
  ) {
    return call(provider.postId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commentsByPostProvider';
}

/// 특정 글의 댓글 목록.
/// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
///
/// Copied from [commentsByPost].
class CommentsByPostProvider extends AutoDisposeProvider<List<Comment>> {
  /// 특정 글의 댓글 목록.
  /// commentsByPost[postId]가 그대로면 ids는 동일 참조 → 다른 글의 댓글 추가 시 재실행되지 않는다.
  ///
  /// Copied from [commentsByPost].
  CommentsByPostProvider(String postId)
    : this._internal(
        (ref) => commentsByPost(ref as CommentsByPostRef, postId),
        from: commentsByPostProvider,
        name: r'commentsByPostProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$commentsByPostHash,
        dependencies: CommentsByPostFamily._dependencies,
        allTransitiveDependencies:
            CommentsByPostFamily._allTransitiveDependencies,
        postId: postId,
      );

  CommentsByPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    List<Comment> Function(CommentsByPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommentsByPostProvider._internal(
        (ref) => create(ref as CommentsByPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Comment>> createElement() {
    return _CommentsByPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsByPostProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommentsByPostRef on AutoDisposeProviderRef<List<Comment>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _CommentsByPostProviderElement
    extends AutoDisposeProviderElement<List<Comment>>
    with CommentsByPostRef {
  _CommentsByPostProviderElement(super.provider);

  @override
  String get postId => (origin as CommentsByPostProvider).postId;
}

String _$commentCountByPostHash() =>
    r'3ce583d29c784abac87a3543e5b45ebf1a4c56e7';

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
///
/// Copied from [commentCountByPost].
@ProviderFor(commentCountByPost)
const commentCountByPostProvider = CommentCountByPostFamily();

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
///
/// Copied from [commentCountByPost].
class CommentCountByPostFamily extends Family<int> {
  /// 특정 글의 댓글 수.
  /// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
  ///
  /// Copied from [commentCountByPost].
  const CommentCountByPostFamily();

  /// 특정 글의 댓글 수.
  /// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
  ///
  /// Copied from [commentCountByPost].
  CommentCountByPostProvider call(String postId) {
    return CommentCountByPostProvider(postId);
  }

  @override
  CommentCountByPostProvider getProviderOverride(
    covariant CommentCountByPostProvider provider,
  ) {
    return call(provider.postId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commentCountByPostProvider';
}

/// 특정 글의 댓글 수.
/// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
///
/// Copied from [commentCountByPost].
class CommentCountByPostProvider extends AutoDisposeProvider<int> {
  /// 특정 글의 댓글 수.
  /// int 값을 select하므로 다른 글에 댓글이 추가되어도 알림이 오지 않는다.
  ///
  /// Copied from [commentCountByPost].
  CommentCountByPostProvider(String postId)
    : this._internal(
        (ref) => commentCountByPost(ref as CommentCountByPostRef, postId),
        from: commentCountByPostProvider,
        name: r'commentCountByPostProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$commentCountByPostHash,
        dependencies: CommentCountByPostFamily._dependencies,
        allTransitiveDependencies:
            CommentCountByPostFamily._allTransitiveDependencies,
        postId: postId,
      );

  CommentCountByPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(int Function(CommentCountByPostRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: CommentCountByPostProvider._internal(
        (ref) => create(ref as CommentCountByPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _CommentCountByPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentCountByPostProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommentCountByPostRef on AutoDisposeProviderRef<int> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _CommentCountByPostProviderElement extends AutoDisposeProviderElement<int>
    with CommentCountByPostRef {
  _CommentCountByPostProviderElement(super.provider);

  @override
  String get postId => (origin as CommentCountByPostProvider).postId;
}

String _$boardNotifierHash() => r'9bb97b4801be7f1968b25dcd6fdda61f71ad1fcd';

/// 모든 게시글·댓글의 단일 상태관리자.
/// 본문은 `Map<id, Post>` / `Map<id, Comment>` 로 정규화 저장하고,
/// 정렬·작성자별·글별 인덱스를 별도로 둔다.
///
/// Copied from [BoardNotifier].
@ProviderFor(BoardNotifier)
final boardNotifierProvider =
    NotifierProvider<BoardNotifier, BoardData>.internal(
      BoardNotifier.new,
      name: r'boardNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$boardNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BoardNotifier = Notifier<BoardData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
