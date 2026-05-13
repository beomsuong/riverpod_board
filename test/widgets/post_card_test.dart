import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_board/models/post.dart';
import 'package:riverpod_board/models/user.dart';
import 'package:riverpod_board/widgets/post_card.dart';

void main() {
  final author = const User(
    id: 'u1',
    name: 'Alice',
    bio: 'hello',
    avatarColor: Colors.indigo,
  );

  final post = Post(
    id: 'p1',
    authorId: 'u1',
    title: '오늘의 글',
    content: '본문 내용입니다.',
    createdAt: DateTime.now().subtract(const Duration(minutes: 3)),
    likedUserIds: const ['u2', 'u3', 'u4'],
  );

  Widget wrap(Widget child) =>
      MaterialApp(home: Scaffold(body: child));

  group('PostCard', () {
    testWidgets('renders all fields via keys when author is provided',
        (tester) async {
      await tester.pumpWidget(
        wrap(
          PostCard(
            post: post,
            author: author,
            commentCount: 5,
            onTap: () {},
          ),
        ),
      );

      expect(find.byKey(PostCard.tapKey), findsOneWidget);
      expect(find.byKey(PostCard.authorRowKey), findsOneWidget);
      expect(find.byKey(PostCard.authorNameKey), findsOneWidget);
      expect(find.byKey(PostCard.createdAtKey), findsOneWidget);
      expect(find.byKey(PostCard.titleKey), findsOneWidget);
      expect(find.byKey(PostCard.contentKey), findsOneWidget);
      expect(find.byKey(PostCard.likeCountKey), findsOneWidget);
      expect(find.byKey(PostCard.commentCountKey), findsOneWidget);

      final authorNameText =
          tester.widget<Text>(find.byKey(PostCard.authorNameKey));
      expect(authorNameText.data, author.name);

      final titleText = tester.widget<Text>(find.byKey(PostCard.titleKey));
      expect(titleText.data, post.title);

      final contentText = tester.widget<Text>(find.byKey(PostCard.contentKey));
      expect(contentText.data, post.content);
    });

    testWidgets('hides author row when author is null', (tester) async {
      await tester.pumpWidget(
        wrap(
          PostCard(
            post: post,
            author: null,
            commentCount: 0,
            onTap: () {},
          ),
        ),
      );

      expect(find.byKey(PostCard.authorRowKey), findsNothing);
      expect(find.byKey(PostCard.authorNameKey), findsNothing);
      expect(find.byKey(PostCard.createdAtKey), findsNothing);
      expect(find.byKey(PostCard.titleKey), findsOneWidget);
    });

    testWidgets('invokes onTap when the card is tapped', (tester) async {
      var tapped = 0;
      await tester.pumpWidget(
        wrap(
          PostCard(
            post: post,
            author: author,
            commentCount: 0,
            onTap: () => tapped++,
          ),
        ),
      );

      await tester.tap(find.byKey(PostCard.tapKey));
      await tester.pump();

      expect(tapped, 1);
    });
  });
}
