import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String authorId,
    required String content,
    required DateTime createdAt,
  }) = _Comment;
}
