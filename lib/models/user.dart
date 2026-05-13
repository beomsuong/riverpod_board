import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String bio,
    required Color avatarColor,
  }) = _User;

  const User._();

  String get avatarInitial => name[0];
}
