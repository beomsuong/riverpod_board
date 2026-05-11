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
String _$postByIdHash() => r'0b8482abaea07c9550067c38f92e960eef593a56';

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

/// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
///
/// Copied from [postById].
@ProviderFor(postById)
const postByIdProvider = PostByIdFamily();

/// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
///
/// Copied from [postById].
class PostByIdFamily extends Family<Post?> {
  /// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
  ///
  /// Copied from [postById].
  const PostByIdFamily();

  /// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
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

/// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
///
/// Copied from [postById].
class PostByIdProvider extends AutoDisposeProvider<Post?> {
  /// 특정 글만 구독. freezed의 == 덕분에 해당 글이 바뀌지 않으면 리빌드하지 않음.
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

String _$boardNotifierHash() => r'99cf80398f9a53e0ad2de983c1f02b0a4169710f';

/// 모든 게시글의 원본 데이터를 보관하는 단일 상태관리자.
///
/// Copied from [BoardNotifier].
@ProviderFor(BoardNotifier)
final boardNotifierProvider =
    NotifierProvider<BoardNotifier, List<Post>>.internal(
      BoardNotifier.new,
      name: r'boardNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$boardNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BoardNotifier = Notifier<List<Post>>;
String _$postIdsHash() => r'a6abc7af3da66d582b52edfa21be8268f4886fe7';

/// 글 ID 목록 전용 Notifier.
/// listEquals로 실제 ID 구성이 바뀔 때만(글 추가·삭제) state를 갱신하여
/// 좋아요·댓글 변경 시 PostListPage가 리빌드되지 않도록 한다.
///
/// Copied from [PostIds].
@ProviderFor(PostIds)
final postIdsProvider = NotifierProvider<PostIds, List<String>>.internal(
  PostIds.new,
  name: r'postIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostIds = Notifier<List<String>>;
String _$postsByAuthorHash() => r'1399e1448d929b3ae7f5b9d18d3107cbca7c640c';

abstract class _$PostsByAuthor
    extends BuildlessAutoDisposeNotifier<List<Post>> {
  late final String authorId;

  List<Post> build(String authorId);
}

/// 특정 작성자의 글 목록 Notifier.
/// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
/// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
///
/// Copied from [PostsByAuthor].
@ProviderFor(PostsByAuthor)
const postsByAuthorProvider = PostsByAuthorFamily();

/// 특정 작성자의 글 목록 Notifier.
/// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
/// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
///
/// Copied from [PostsByAuthor].
class PostsByAuthorFamily extends Family<List<Post>> {
  /// 특정 작성자의 글 목록 Notifier.
  /// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
  /// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
  ///
  /// Copied from [PostsByAuthor].
  const PostsByAuthorFamily();

  /// 특정 작성자의 글 목록 Notifier.
  /// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
  /// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
  ///
  /// Copied from [PostsByAuthor].
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

/// 특정 작성자의 글 목록 Notifier.
/// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
/// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
///
/// Copied from [PostsByAuthor].
class PostsByAuthorProvider
    extends AutoDisposeNotifierProviderImpl<PostsByAuthor, List<Post>> {
  /// 특정 작성자의 글 목록 Notifier.
  /// listEquals + freezed의 Post.== 로 해당 작성자의 글이 실제로 변경됐을 때만
  /// state를 갱신하여 다른 작성자 글 변경 시 AuthorProfilePage가 리빌드되지 않도록 한다.
  ///
  /// Copied from [PostsByAuthor].
  PostsByAuthorProvider(String authorId)
    : this._internal(
        () => PostsByAuthor()..authorId = authorId,
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
  List<Post> runNotifierBuild(covariant PostsByAuthor notifier) {
    return notifier.build(authorId);
  }

  @override
  Override overrideWith(PostsByAuthor Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostsByAuthorProvider._internal(
        () => create()..authorId = authorId,
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
  AutoDisposeNotifierProviderElement<PostsByAuthor, List<Post>>
  createElement() {
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
mixin PostsByAuthorRef on AutoDisposeNotifierProviderRef<List<Post>> {
  /// The parameter `authorId` of this provider.
  String get authorId;
}

class _PostsByAuthorProviderElement
    extends AutoDisposeNotifierProviderElement<PostsByAuthor, List<Post>>
    with PostsByAuthorRef {
  _PostsByAuthorProviderElement(super.provider);

  @override
  String get authorId => (origin as PostsByAuthorProvider).authorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
