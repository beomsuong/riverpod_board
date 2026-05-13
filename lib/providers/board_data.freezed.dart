// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoardData {

 Map<String, Post> get posts; List<String> get orderedIds; Map<String, List<String>> get byAuthor; Map<String, Comment> get comments; Map<String, List<String>> get commentsByPost;
/// Create a copy of BoardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardDataCopyWith<BoardData> get copyWith => _$BoardDataCopyWithImpl<BoardData>(this as BoardData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardData&&const DeepCollectionEquality().equals(other.posts, posts)&&const DeepCollectionEquality().equals(other.orderedIds, orderedIds)&&const DeepCollectionEquality().equals(other.byAuthor, byAuthor)&&const DeepCollectionEquality().equals(other.comments, comments)&&const DeepCollectionEquality().equals(other.commentsByPost, commentsByPost));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),const DeepCollectionEquality().hash(orderedIds),const DeepCollectionEquality().hash(byAuthor),const DeepCollectionEquality().hash(comments),const DeepCollectionEquality().hash(commentsByPost));

@override
String toString() {
  return 'BoardData(posts: $posts, orderedIds: $orderedIds, byAuthor: $byAuthor, comments: $comments, commentsByPost: $commentsByPost)';
}


}

/// @nodoc
abstract mixin class $BoardDataCopyWith<$Res>  {
  factory $BoardDataCopyWith(BoardData value, $Res Function(BoardData) _then) = _$BoardDataCopyWithImpl;
@useResult
$Res call({
 Map<String, Post> posts, List<String> orderedIds, Map<String, List<String>> byAuthor, Map<String, Comment> comments, Map<String, List<String>> commentsByPost
});




}
/// @nodoc
class _$BoardDataCopyWithImpl<$Res>
    implements $BoardDataCopyWith<$Res> {
  _$BoardDataCopyWithImpl(this._self, this._then);

  final BoardData _self;
  final $Res Function(BoardData) _then;

/// Create a copy of BoardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? orderedIds = null,Object? byAuthor = null,Object? comments = null,Object? commentsByPost = null,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as Map<String, Post>,orderedIds: null == orderedIds ? _self.orderedIds : orderedIds // ignore: cast_nullable_to_non_nullable
as List<String>,byAuthor: null == byAuthor ? _self.byAuthor : byAuthor // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as Map<String, Comment>,commentsByPost: null == commentsByPost ? _self.commentsByPost : commentsByPost // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardData].
extension BoardDataPatterns on BoardData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardData value)  $default,){
final _that = this;
switch (_that) {
case _BoardData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardData value)?  $default,){
final _that = this;
switch (_that) {
case _BoardData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Post> posts,  List<String> orderedIds,  Map<String, List<String>> byAuthor,  Map<String, Comment> comments,  Map<String, List<String>> commentsByPost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardData() when $default != null:
return $default(_that.posts,_that.orderedIds,_that.byAuthor,_that.comments,_that.commentsByPost);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Post> posts,  List<String> orderedIds,  Map<String, List<String>> byAuthor,  Map<String, Comment> comments,  Map<String, List<String>> commentsByPost)  $default,) {final _that = this;
switch (_that) {
case _BoardData():
return $default(_that.posts,_that.orderedIds,_that.byAuthor,_that.comments,_that.commentsByPost);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Post> posts,  List<String> orderedIds,  Map<String, List<String>> byAuthor,  Map<String, Comment> comments,  Map<String, List<String>> commentsByPost)?  $default,) {final _that = this;
switch (_that) {
case _BoardData() when $default != null:
return $default(_that.posts,_that.orderedIds,_that.byAuthor,_that.comments,_that.commentsByPost);case _:
  return null;

}
}

}

/// @nodoc


class _BoardData extends BoardData {
  const _BoardData({required final  Map<String, Post> posts, required final  List<String> orderedIds, required final  Map<String, List<String>> byAuthor, required final  Map<String, Comment> comments, required final  Map<String, List<String>> commentsByPost}): _posts = posts,_orderedIds = orderedIds,_byAuthor = byAuthor,_comments = comments,_commentsByPost = commentsByPost,super._();
  

 final  Map<String, Post> _posts;
@override Map<String, Post> get posts {
  if (_posts is EqualUnmodifiableMapView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_posts);
}

 final  List<String> _orderedIds;
@override List<String> get orderedIds {
  if (_orderedIds is EqualUnmodifiableListView) return _orderedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderedIds);
}

 final  Map<String, List<String>> _byAuthor;
@override Map<String, List<String>> get byAuthor {
  if (_byAuthor is EqualUnmodifiableMapView) return _byAuthor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byAuthor);
}

 final  Map<String, Comment> _comments;
@override Map<String, Comment> get comments {
  if (_comments is EqualUnmodifiableMapView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_comments);
}

 final  Map<String, List<String>> _commentsByPost;
@override Map<String, List<String>> get commentsByPost {
  if (_commentsByPost is EqualUnmodifiableMapView) return _commentsByPost;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_commentsByPost);
}


/// Create a copy of BoardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardDataCopyWith<_BoardData> get copyWith => __$BoardDataCopyWithImpl<_BoardData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardData&&const DeepCollectionEquality().equals(other._posts, _posts)&&const DeepCollectionEquality().equals(other._orderedIds, _orderedIds)&&const DeepCollectionEquality().equals(other._byAuthor, _byAuthor)&&const DeepCollectionEquality().equals(other._comments, _comments)&&const DeepCollectionEquality().equals(other._commentsByPost, _commentsByPost));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),const DeepCollectionEquality().hash(_orderedIds),const DeepCollectionEquality().hash(_byAuthor),const DeepCollectionEquality().hash(_comments),const DeepCollectionEquality().hash(_commentsByPost));

@override
String toString() {
  return 'BoardData(posts: $posts, orderedIds: $orderedIds, byAuthor: $byAuthor, comments: $comments, commentsByPost: $commentsByPost)';
}


}

/// @nodoc
abstract mixin class _$BoardDataCopyWith<$Res> implements $BoardDataCopyWith<$Res> {
  factory _$BoardDataCopyWith(_BoardData value, $Res Function(_BoardData) _then) = __$BoardDataCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Post> posts, List<String> orderedIds, Map<String, List<String>> byAuthor, Map<String, Comment> comments, Map<String, List<String>> commentsByPost
});




}
/// @nodoc
class __$BoardDataCopyWithImpl<$Res>
    implements _$BoardDataCopyWith<$Res> {
  __$BoardDataCopyWithImpl(this._self, this._then);

  final _BoardData _self;
  final $Res Function(_BoardData) _then;

/// Create a copy of BoardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? orderedIds = null,Object? byAuthor = null,Object? comments = null,Object? commentsByPost = null,}) {
  return _then(_BoardData(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as Map<String, Post>,orderedIds: null == orderedIds ? _self._orderedIds : orderedIds // ignore: cast_nullable_to_non_nullable
as List<String>,byAuthor: null == byAuthor ? _self._byAuthor : byAuthor // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as Map<String, Comment>,commentsByPost: null == commentsByPost ? _self._commentsByPost : commentsByPost // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
