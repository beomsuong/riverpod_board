import 'package:flutter/material.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.bio,
    required this.avatarColor,
  });

  final String id;
  final String name;
  final String bio;
  final Color avatarColor;

  String get avatarInitial => name[0];
}
