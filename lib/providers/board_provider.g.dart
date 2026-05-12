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

String _$boardNotifierHash() => r'6e895e842e4a333efdb33d1f29acaa2d7d7805da';

/// 모든 게시글의 단일 상태관리자.
/// 본문은 Map<id, Post>로 정규화 저장하고, 정렬·작성자별 인덱스를 별도로 둔다.
/// addPost/toggleLike/addComment 모두 O(1) 본질 작업.
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
