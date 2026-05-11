class Comment {
  const Comment({
    required this.id,
    required this.authorId,
    required this.content,
    required this.createdAt,
  });

  final String id;
  final String authorId;
  final String content;
  final DateTime createdAt;
}
