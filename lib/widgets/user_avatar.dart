import 'package:flutter/material.dart';

import '../models/user.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.user, this.radius = 20});

  static const avatarKey = Key('userAvatar');
  static const initialKey = Key('userAvatarInitial');

  final User user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      key: avatarKey,
      radius: radius,
      backgroundColor: user.avatarColor,
      child: Text(
        user.avatarInitial,
        key: initialKey,
        style: TextStyle(
          color: Colors.white,
          fontSize: radius * 0.8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
