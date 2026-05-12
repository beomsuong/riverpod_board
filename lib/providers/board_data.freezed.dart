// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BoardData {
  Map<String, Post> get posts => throw _privateConstructorUsedError;
  List<String> get orderedIds => throw _privateConstructorUsedError;
  Map<String, List<String>> get byAuthor => throw _privateConstructorUsedError;

  /// Create a copy of BoardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardDataCopyWith<BoardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardDataCopyWith<$Res> {
  factory $BoardDataCopyWith(BoardData value, $Res Function(BoardData) then) =
      _$BoardDataCopyWithImpl<$Res, BoardData>;
  @useResult
  $Res call({
    Map<String, Post> posts,
    List<String> orderedIds,
    Map<String, List<String>> byAuthor,
  });
}

/// @nodoc
class _$BoardDataCopyWithImpl<$Res, $Val extends BoardData>
    implements $BoardDataCopyWith<$Res> {
  _$BoardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? orderedIds = null,
    Object? byAuthor = null,
  }) {
    return _then(
      _value.copyWith(
            posts:
                null == posts
                    ? _value.posts
                    : posts // ignore: cast_nullable_to_non_nullable
                        as Map<String, Post>,
            orderedIds:
                null == orderedIds
                    ? _value.orderedIds
                    : orderedIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            byAuthor:
                null == byAuthor
                    ? _value.byAuthor
                    : byAuthor // ignore: cast_nullable_to_non_nullable
                        as Map<String, List<String>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoardDataImplCopyWith<$Res>
    implements $BoardDataCopyWith<$Res> {
  factory _$$BoardDataImplCopyWith(
    _$BoardDataImpl value,
    $Res Function(_$BoardDataImpl) then,
  ) = __$$BoardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, Post> posts,
    List<String> orderedIds,
    Map<String, List<String>> byAuthor,
  });
}

/// @nodoc
class __$$BoardDataImplCopyWithImpl<$Res>
    extends _$BoardDataCopyWithImpl<$Res, _$BoardDataImpl>
    implements _$$BoardDataImplCopyWith<$Res> {
  __$$BoardDataImplCopyWithImpl(
    _$BoardDataImpl _value,
    $Res Function(_$BoardDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? orderedIds = null,
    Object? byAuthor = null,
  }) {
    return _then(
      _$BoardDataImpl(
        posts:
            null == posts
                ? _value._posts
                : posts // ignore: cast_nullable_to_non_nullable
                    as Map<String, Post>,
        orderedIds:
            null == orderedIds
                ? _value._orderedIds
                : orderedIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        byAuthor:
            null == byAuthor
                ? _value._byAuthor
                : byAuthor // ignore: cast_nullable_to_non_nullable
                    as Map<String, List<String>>,
      ),
    );
  }
}

/// @nodoc

class _$BoardDataImpl extends _BoardData {
  const _$BoardDataImpl({
    required final Map<String, Post> posts,
    required final List<String> orderedIds,
    required final Map<String, List<String>> byAuthor,
  }) : _posts = posts,
       _orderedIds = orderedIds,
       _byAuthor = byAuthor,
       super._();

  final Map<String, Post> _posts;
  @override
  Map<String, Post> get posts {
    if (_posts is EqualUnmodifiableMapView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_posts);
  }

  final List<String> _orderedIds;
  @override
  List<String> get orderedIds {
    if (_orderedIds is EqualUnmodifiableListView) return _orderedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderedIds);
  }

  final Map<String, List<String>> _byAuthor;
  @override
  Map<String, List<String>> get byAuthor {
    if (_byAuthor is EqualUnmodifiableMapView) return _byAuthor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byAuthor);
  }

  @override
  String toString() {
    return 'BoardData(posts: $posts, orderedIds: $orderedIds, byAuthor: $byAuthor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardDataImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality().equals(
              other._orderedIds,
              _orderedIds,
            ) &&
            const DeepCollectionEquality().equals(other._byAuthor, _byAuthor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_posts),
    const DeepCollectionEquality().hash(_orderedIds),
    const DeepCollectionEquality().hash(_byAuthor),
  );

  /// Create a copy of BoardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardDataImplCopyWith<_$BoardDataImpl> get copyWith =>
      __$$BoardDataImplCopyWithImpl<_$BoardDataImpl>(this, _$identity);
}

abstract class _BoardData extends BoardData {
  const factory _BoardData({
    required final Map<String, Post> posts,
    required final List<String> orderedIds,
    required final Map<String, List<String>> byAuthor,
  }) = _$BoardDataImpl;
  const _BoardData._() : super._();

  @override
  Map<String, Post> get posts;
  @override
  List<String> get orderedIds;
  @override
  Map<String, List<String>> get byAuthor;

  /// Create a copy of BoardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardDataImplCopyWith<_$BoardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
