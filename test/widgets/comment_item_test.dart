import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_board/models/comment.dart';
import 'package:riverpod_board/models/user.dart';
import 'package:riverpod_board/widgets/comment_item.dart';

void main() {
  const author = User(
    id: 'u1',
    name: 'Bob',
    bio: 'hi',
    avatarColor: Colors.teal,
  );

  final comment = Comment(
    id: 'c1',
    postId: 'p1',
    authorId: 'u1',
    content: '댓글 본문입니다.',
    createdAt: DateTime.now().subtract(const Duration(minutes: 1)),
  );

  Widget wrap(Widget child) =>
      MaterialApp(home: Scaffold(body: child));

  group('CommentItem', () {
    testWidgets('renders author info and content when author is provided',
        (tester) async {
      await tester.pumpWidget(
        wrap(CommentItem(comment: comment, author: author)),
      );

      expect(find.byKey(CommentItem.rootKey), findsOneWidget);
      expect(find.byKey(CommentItem.avatarKey), findsOneWidget);
      expect(find.byKey(CommentItem.authorNameKey), findsOneWidget);
      expect(find.byKey(CommentItem.createdAtKey), findsOneWidget);
      expect(find.byKey(CommentItem.contentKey), findsOneWidget);

      final nameText =
          tester.widget<Text>(find.byKey(CommentItem.authorNameKey));
      expect(nameText.data, author.name);

      final contentText =
          tester.widget<Text>(find.byKey(CommentItem.contentKey));
      expect(contentText.data, comment.content);
    });

    testWidgets('shows fallback name and hides avatar when author is null',
        (tester) async {
      await tester.pumpWidget(
        wrap(CommentItem(comment: comment, author: null)),
      );

      expect(find.byKey(CommentItem.avatarKey), findsNothing);
      expect(find.byKey(CommentItem.authorNameKey), findsOneWidget);

      final nameText =
          tester.widget<Text>(find.byKey(CommentItem.authorNameKey));
      expect(nameText.data, '알 수 없음');
    });
  });
}
