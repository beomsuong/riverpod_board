import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_board/models/user.dart';
import 'package:riverpod_board/widgets/user_avatar.dart';

void main() {
  const user = User(
    id: 'u1',
    name: 'Alice',
    bio: 'hello',
    avatarColor: Colors.indigo,
  );

  Widget wrap(Widget child) =>
      MaterialApp(home: Scaffold(body: Center(child: child)));

  group('UserAvatar', () {
    testWidgets('renders avatar and initial via keys', (tester) async {
      await tester.pumpWidget(wrap(const UserAvatar(user: user)));

      expect(find.byKey(UserAvatar.avatarKey), findsOneWidget);
      expect(find.byKey(UserAvatar.initialKey), findsOneWidget);

      final initialText =
          tester.widget<Text>(find.byKey(UserAvatar.initialKey));
      expect(initialText.data, user.avatarInitial);
    });

    testWidgets('applies the given radius to the CircleAvatar', (tester) async {
      await tester.pumpWidget(
        wrap(const UserAvatar(user: user, radius: 32)),
      );

      final avatar =
          tester.widget<CircleAvatar>(find.byKey(UserAvatar.avatarKey));
      expect(avatar.radius, 32);
      expect(avatar.backgroundColor, user.avatarColor);
    });
  });
}
